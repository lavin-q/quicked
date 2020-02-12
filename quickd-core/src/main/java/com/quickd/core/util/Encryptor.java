package com.quickd.core.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 加解密工具类 （提供AES加解密，MD5多次哈希...）
 * @author Mazhicheng
 * @version v2.0
 * @date 2019/01/01
 */
@Slf4j
public class Encryptor {

	/**
	 * 算法
	 */
	private static final String KEY_ALGORITHM = "AES";
	private static final String CIPHER_ALGORITHM = "AES/ECB/PKCS5PADDING";
	/**
	 * 默认加密seed（可通过配置文件）
	 */
	private static final String KEY_DEFAULT =  "JEEDCP";

	private static final String KEY_FILL = "abcdefghijklmnop";

	/**
	 * 加密Cipher缓存
 	 */
	private static Map<String, Cipher> encryptorMap = new ConcurrentHashMap<>();
	/**
	 * 解密Cipher缓存
	 */
	private static Map<String, Cipher> decryptorMap = new ConcurrentHashMap<>();

	/**
	 * 加密字符串（可指定加密密钥）
	 * @param input 待加密文本
	 * @param key 密钥（可选）
	 * @return
	 * @throws Exception
	 */
	public static String encrypt(String input, String... key){
		String seedKey = (key!=null&&key.length>0)? key[0] : KEY_DEFAULT;
		try{
			Cipher cipher = getEncryptor(seedKey);
			byte[] enBytes = cipher.doFinal(input.getBytes());
			return Base64.getEncoder().encodeToString(enBytes);
		}
		catch(Exception e){
			log.error("加密出错:"+input, e);
			return input;
		}
	}

	public static String encryptPassword(String password, String salt) {
		String encryptedPassword = (new SimpleHash("md5", password, ByteSource.Util.bytes(salt), 2)).toHex();
		return encryptedPassword;
	}

	/**
	 * 解密字符串
	 * @param input 待解密文本
	 * @param key 加密key（可选）
	 * @return
	 * @throws Exception
	 */
	public static String decrypt(String input, String... key){
		if(StringUtils.isEmpty(input)){
			return input;
		}
		String seedKey = (key!=null&&key.length>0)? key[0] : KEY_DEFAULT;
		try{
			Cipher cipher = getDecryptor(seedKey);
			byte[] deBytes = Base64.getDecoder().decode(input.getBytes());
			return new String(cipher.doFinal(deBytes));
		}
		catch(Exception e){
			log.error("解密出错:"+input, e);
			return input;
		}
	}

	/***
	 * 获取指定key的加密器
	 * @param key 加密密钥
	 * @return
	 * @throws Exception
	 */
	private static Cipher getEncryptor(String key) throws Exception{
		byte[] keyBytes = getKey(key);
		Cipher encryptor = encryptorMap.get(new String(keyBytes));
		if(encryptor == null){
			SecretKeySpec skeyspec = new SecretKeySpec(keyBytes, KEY_ALGORITHM);
			encryptor = Cipher.getInstance(CIPHER_ALGORITHM);
			encryptor.init(Cipher.ENCRYPT_MODE, skeyspec);
			// 放入缓存
			encryptorMap.put(key, encryptor);
		}
		return encryptor;
	}

	/***
	 * 获取指定key的解密器
	 * @param key 解密密钥
	 * @return
	 * @throws Exception
	 */
	private static Cipher getDecryptor(String key) throws Exception{
		byte[] keyBytes = getKey(key);
		Cipher decryptor = encryptorMap.get(new String(keyBytes));
		if(decryptor == null){
			SecretKeySpec skeyspec = new SecretKeySpec(keyBytes, KEY_ALGORITHM);
			decryptor = Cipher.getInstance(CIPHER_ALGORITHM);
			decryptor.init(Cipher.DECRYPT_MODE, skeyspec);
			// 放入缓存
			decryptorMap.put(key, decryptor);
		}
		return decryptor;
	}

	/***
	 * 获取key，如非16位则调整为16位
	 * @param seed
	 * @return
	 */
	private static byte[] getKey(String seed){
		if(StringUtils.isEmpty(seed)){
			seed = KEY_DEFAULT;
		}
		if(seed.length() < 16){
			seed = seed + StringUtils.substring(KEY_FILL, 0,16-seed.length());
		}
		else if(seed.length() > 16){
			seed = StringUtils.substring(KEY_FILL, 0,16);
		}
		return seed.getBytes();
	}

	public  static  void main(String args[]){
		System.out.println(
				encryptPassword("admin","26bebdc6e218452786dc3ad7dd45fb0b"));
	}

}