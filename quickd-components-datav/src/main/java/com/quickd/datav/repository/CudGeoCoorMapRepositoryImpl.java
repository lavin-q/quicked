package com.quickd.datav.repository;

import java.util.List;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.FindAndModifyOptions;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import com.quickd.datav.domain.GeoCoorMap;
import com.mongodb.MongoException;

@Repository
@Slf4j
public class CudGeoCoorMapRepositoryImpl implements com.quickd.datav.repository.CudGeoCoorMapRepository {


	private final MongoTemplate mongo;
	
	@Autowired
	public CudGeoCoorMapRepositoryImpl(MongoTemplate mongo) {

		this.mongo = mongo;
	}
	
	@Override
	public GeoCoorMap upsert(Query query, GeoCoorMap entity) {
		
		Assert.notNull(entity);

		if (query == null) {
			query = new Query(Criteria.where("province").is(entity.getProvince()).and("city").is(entity.getCity()).and("county").is(entity.getCounty()));
		}
		Update dataset = new Update();
		dataset.set("province", entity.getProvince());
		dataset.set("city", entity.getCity());
		dataset.set("county", entity.getCounty());
		dataset.set("zipCode", entity.getZipCode());
		dataset.set("location", entity.getLocation());

		GeoCoorMap dbret = mongo.findAndModify(query, dataset, new FindAndModifyOptions().returnNew(true).upsert(true), GeoCoorMap.class);
		
		return dbret;
	}

	@Override
	public List<GeoCoorMap> findAll() {
		return this.mongo.findAll(GeoCoorMap.class);
	}
	
	public List<GeoCoorMap> findBy(Map<String,String> cnd) {
		if ( cnd.isEmpty() )
			return this.findAll();
		
		Query query = new Query();
		Criteria c = null;
		for (Map.Entry<String, String> e : cnd.entrySet()) {
			if ( c == null )
				c = Criteria.where(e.getKey()).is(e.getValue());
			else
				c = c.and(e.getKey()).is(e.getValue());
		}
		query.addCriteria(c);
		log.info(query.toString());
		return this.mongo.find(query, GeoCoorMap.class);
	}
	
	public Boolean delete(String id) {
		try {
			this.mongo.remove(new GeoCoorMap(id));
			return true;
		}
		catch (MongoException e) {
			return false;
		}
	}
}
