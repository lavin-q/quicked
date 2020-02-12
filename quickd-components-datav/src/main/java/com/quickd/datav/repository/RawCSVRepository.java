package com.quickd.datav.repository;

import java.util.ArrayList;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.quickd.datav.domain.RawCSV;
import com.quickd.datav.domain.TitleCell;

public interface RawCSVRepository extends MongoRepository<RawCSV, String>{
	RawCSV findByHash(String hash);

	void deleteByHash(String hash);

}
