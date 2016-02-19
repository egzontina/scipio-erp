<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#assign logo><img src="<@ofbizContentUrl>/images/feather-tiny.png</@ofbizContentUrl>"/></#assign>
<#assign labelUsername><i class="${styles.icon!} ${styles.icon_user!}"></i></#assign>
<#assign labelPassword><i class="${styles.icon!} ${styles.icon_password!}"></i></#assign>
<#assign labelTenant><i class="${styles.icon!} ${styles.icon_tenant!}"></i></#assign>
<#assign username = requestParameters.USERNAME?default((sessionAttributes.autoUserLogin.userLoginId)?default(""))>

<@row>
  <@cell class="${styles.grid_large!}3 ${styles.grid_large!}centered login-box" last=true id="login">
    <div id="login-box-title" class="${styles.login_header!}">
        <@heading level=1>${logo} ${uiLabelMap.CommonPassword!}</@heading>
    </div>
    <@section id="login-box-content">
        <form method="post" action="<@ofbizUrl>forgotPassword${previousParams!}</@ofbizUrl>" name="forgotpassword">
            <@field type="input" name="USERNAME" value="${username}" size="20" collapse=true placeholder="${uiLabelMap.CommonUsername}" tooltip="${uiLabelMap.CommonUsername}" label="${labelUsername!}"/>
            <@row>
                <@cell columns=12 >
                    <a href="<@ofbizUrl>authview</@ofbizUrl>" class="${styles.link_nav_cancel!}">${uiLabelMap.CommonGoBack}</a>
                    <@field type="submit" name="GET_PASSWORD_HINT" class="${styles.link_run_sys!} ${styles.action_view!}" value="${uiLabelMap.CommonGetPasswordHint}" container=false/>
                    <@field type="submit" name="EMAIL_PASSWORD" class="${styles.link_run_sys!} ${styles.action_send!}" value="${uiLabelMap.CommonEmailPassword}" container=false/>
                    <input type="hidden" name="JavaScriptEnabled" value="N"/>
                </@cell>
            </@row>
        </form>
    </@section>
  </@cell>
</@row>
