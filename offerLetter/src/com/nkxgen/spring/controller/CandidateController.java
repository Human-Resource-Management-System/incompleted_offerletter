package com.nkxgen.spring.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nkxgen.spring.orm.dao.CandidateDAO;
import com.nkxgen.spring.orm.model.Candidate;
import com.nkxgen.spring.orm.model.OfferModel;

@Controller
public class CandidateController {

	private final CandidateDAO cd;

	@Autowired
	public CandidateController(CandidateDAO cd) {
		this.cd = cd;

	}

	@RequestMapping("/")

	public String getissuingCandidates(Model model) {
		List<Candidate> candidates = cd.findAllIssuedCandidates();

		model.addAttribute("candidates", candidates);

		return "front";
	}

	@RequestMapping("/get-candidate-details")
	public String getEmployeeDetails(@RequestParam("id") int candidateId, Model model) {
		Candidate candidate = cd.getCandidateById(candidateId);
		model.addAttribute("candidate", candidate);
		model.addAttribute("offerModel", new OfferModel());

		return "viewCandidate";
	}

	@RequestMapping("/email")
	public String sendToMail(@ModelAttribute("offerModel") @Validated OfferModel offerModel, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			// Handle validation errors
			return "email";
		}

		// Access the form data from the offerModel object
		String candidateName = offerModel.getCandidateName();
		String adminMobile = offerModel.getAdminMobile();
		String adminEmail = offerModel.getAdminEmail();
		LocalDate offerDate = offerModel.getOfferDate();
		String offeredJob = offerModel.getOfferedJob();
		LocalDate reportingDate = offerModel.getReportingDate();
		List<String> documents = offerModel.getDocuments();

		// Perform further processing with the form data
		// ...

		// Add the offerModel object to the model if needed
		model.addAttribute("offerModel", offerModel);

		// Return the appropriate view
		return "email";
	}

}
