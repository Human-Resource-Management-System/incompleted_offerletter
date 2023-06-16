package com.nkxgen.spring.orm.dao;

import java.util.List;

import com.nkxgen.spring.orm.model.Candidate;

public interface CandidateDAO {
	List<Candidate> findAllIssuedCandidates();

	Candidate findCandidateById(int id);

	Candidate getCandidateById(int employeeId);

}
