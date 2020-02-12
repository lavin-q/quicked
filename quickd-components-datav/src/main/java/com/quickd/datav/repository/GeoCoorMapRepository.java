package com.quickd.datav.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import com.quickd.datav.domain.GeoCoorMap;


public interface GeoCoorMapRepository extends MongoRepository<GeoCoorMap, String >
{
	List<GeoCoorMap> findByProvince(String provice);
	List<GeoCoorMap> findByProvinceAndCity(String province, String city);
	List<GeoCoorMap> findByProvinceAndCityAndCounty(String province, String city, String county);
}
