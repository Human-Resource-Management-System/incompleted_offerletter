<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.time.LocalDate" %>
<%@page import="com.nkxgen.spring.orm.model.Candidate" %>

<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }

    h1 {
      font-size: 24px;
      margin-bottom: 10px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      font-weight: bold;
      display: block;
    }

    .form-group input[type="text"],
    .form-group input[type="email"] {
      width: 300px;
      padding: 5px;
      border: 1px solid #ddd;
    }

    .form-group input[type="text"][readonly],
    .form-group input[type="email"][readonly] {
      background-color: #f5f5f5;
    }

    .form-group input[type="file"] {
      margin-top: 5px;
    }

    #components-container {
      margin-top: 20px;
    }

    .component {
      border: 1px solid #ddd;
      padding: 10px;
      margin-bottom: 10px;
    }

    .component label {
      display: block;
      margin-bottom: 5px;
    }

    .component select {
      width: 300px;
      padding: 5px;
    }

    .add-component-button {
      margin-top: 10px;
      font-size: 14px;
    }

    .create-button {
      margin-top: 20px;
      font-size: 16px;
      padding: 10px 20px;
      display: block;
    }
  </style>
</head>
<body>
  <h1>New Offer Letter</h1>
           <%  Candidate candidate = (Candidate)request.getAttribute("candidate"); %> 

   <div class="form-group">
    <label for="candidate-name">Candidate Name:</label>
<input type="text" id="candidateName" path="candidateName" value="<%= candidate.getCand_firstname() + candidate.getCand_lastname() %>" readonly>
  </div>
  
<div class="form-group">
    <label for="hr-mobile">Admin Mobile:</label>
    <input type="text" id="adminMobile" name="adminMobile" value="9874563212" readonly>
  </div>

  <div class="form-group">
    <label for="hr-email">Admin Email:</label>
    <input type="email" id="adminEmail" name="adminEmail" value="hrm@gmail.com" readonly>
  </div>

  <div class="form-group">
    <label for="offer-date">Offer Date:</label>
    <input type="text" id="offerDate" name="offerDate" value="<%= LocalDate.now() %>" readonly>
  </div>

  <div class="form-group">
    <label for="offered-job">Offered Job:</label>
    <input type="text" id="offeredJob" name="offeredJob">
  </div>

  <div class="form-group">
    <label for="reporting-date">Reporting Date:</label>
    <input type="text" id="reportingDate" name="reportingDate">
  </div>

  

 

  <div id="components-container">
    <!-- Components will be dynamically added here -->
  </div>

  <button class="add-component-button" onclick="addComponent()">Add Component</button>
  <br>
  
<form action="email" method="POST" modelAttribute="offerModel">
  <button class="create-button" onclick="displaySelectedOptions()">Create</button>

  <script>
    let componentCount = 0;

    function addComponent() {
      const componentsContainer = document.getElementById('components-container');
      componentCount++;

      const component = document.createElement('div');
      component.className = 'component';
      component.innerHTML = `
        <label for="component-input-${componentCount}">Document:</label>
        <select id="documents" path="documents">
          <option value="resume">resume</option>
          <option value="experince letter">experince letter</option>
          <option value="hike letter">hike letter</option>
          <option value="relieving letter">relieving letter</option>
          <option value="medical report">medical report</option>

        </select>
      `;

      componentsContainer.appendChild(component);
    }

    function displaySelectedOptions() {
      const selectedOptions = [];

      for (let i = 1; i <= componentCount; i++) {
        const componentId = `component-input-${i}`;
        const component = document.getElementById(componentId);
        const selectedOption = component.value;
        selectedOptions.push(selectedOption);
      }

      alert(`Selected Options: ${selectedOptions.join(', ')}`);
    }
  </script>
</body>
</html>
