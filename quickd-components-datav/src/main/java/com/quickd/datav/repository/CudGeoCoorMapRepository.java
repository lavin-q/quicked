package com.quickd.datav.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.mongodb.core.query.Query;
import com.quickd.datav.domain.GeoCoorMap;
import com.quickd.datav.utils.CommonResult;
import com.mongodb.WriteResult;


public interface CudGeoCoorMapRepository {
	List<GeoCoorMap> findAll();
	List<GeoCoorMap> findBy(Map<String, String> cnd);
	GeoCoorMap upsert(Query query, GeoCoorMap entity);
	Boolean delete(String id);
}
