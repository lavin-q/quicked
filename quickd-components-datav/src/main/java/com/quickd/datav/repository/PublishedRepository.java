package com.quickd.datav.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.quickd.datav.domain.Published;

@Repository
public interface PublishedRepository extends MongoRepository<Published, String> {
	/**
	 * @param id
	 * @return
	 */
	Published findByHash(String id);

	/**
	 * @param hash
	 * @return
	 */
	String deleteByHash(String hash);
}
