package com.nkxgen.spring.orm.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nkxgen.spring.orm.model.Candidate;

@Repository
public class CandidateDAOImpl implements CandidateDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public List<Candidate> findAllIssuedCandidates() {
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Candidate> cq = cb.createQuery(Candidate.class);
		Root<Candidate> root = cq.from(Candidate.class);
		cq.select(root);
		cq.where(cb.equal(root.get("cand_status"), "NA"));
		TypedQuery<Candidate> query = entityManager.createQuery(cq);
		return query.getResultList();
	}

	public Candidate getCandidateById(int candidateId) {
		return entityManager.find(Candidate.class, candidateId);
	}

	@Override
	public Candidate findCandidateById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
