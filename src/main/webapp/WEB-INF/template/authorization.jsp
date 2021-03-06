<!doctype html>
<!--<%
/*
 * Copyright (C) 2016 Authlete, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific
 * language governing permissions and limitations under the
 * License.
 */
%>-->
<!--
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% response.setHeader("Cache-Control", "no-store"); %>
-->
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, user-scalable=yes">
  <title>${model.serviceName} | Authorization</title>
  <link rel="stylesheet" href="/css/authorization.css">
  <!-- <% /* //-->
  <link rel="stylesheet" href="../../css/authorization.css">
  <!-- */ %> //-->
</head>
<body class="font-default">
  <div id="page_title">${model.serviceName}</div>

  <div id="content">
    <h3 id="client-name">${model.clientName}</h3>
    <div class="indent">
      <img id="logo" src="${model.logoUri}" alt="[Logo] (150x150)">

      <div id="client-summary">
        <p>${model.description}</p>
        <ul id="client-link-list">
          <c:if test="${model.clientUri != null}">
          <li><a target="_blank" href="${model.clientUri}">Homepage</a>
          </c:if>

          <c:if test="${model.policyUri != null}">
          <li><a target="_blank" href="${model.policyUri}">Policy</a>
          </c:if>

          <c:if test="${model.tosUri != null}">
          <li><a target="_blank" href="${model.tosUri}">Terms of Service</a>
          </c:if>
        </ul>
      </div>

      <div style="clear: both;"></div>
    </div>

    <c:if test="${model.scopes != null}">
    <h4 id="permissions">Permissions</h4>
    <div class="indent">
      <p>The application is requesting the following permissions.</p>

      <dl id="scope-list">
        <c:forEach var="scope" items="${model.scopes}">
        <dt>${scope.name}</dt>
        <dd>${scope.description}</dd>
        </c:forEach>
      </dl>
    </div>
    </c:if>

    <h4 id="authorization">Authorization</h4>
    <div class="indent">
      <p>Do you grant authorization to the application?</p>

      <form id="authorization-form" action="/api/authorization/decision" method="POST">
        <div id="login-fields" class="indent">
          <div id="login-prompt">Input Login ID and password.</div>
          <input type="text" id="loginId" name="loginId" placeholder="Login ID"
                 class="font-default" required value="${model.loginId}" ${model.loginIdReadOnly}>
          <input type="password" id="password" name="password" placeholder="Password"
                 class="font-default" required>
        </div>

        <div id="authorization-form-buttons">
          <input type="submit" name="authorized" id="authorize-button" value="Authorize" class="font-default"/>
          <input type="submit" name="denied"     id="deny-button"      value="Deny"      class="font-default"/>
        </div>
      </form>
    </div>
  </div>

</body>
</html>
