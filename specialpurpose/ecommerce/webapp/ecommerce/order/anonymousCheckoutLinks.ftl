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
<@script>
function submitForm(form) {
   form.submit();
}
</@script>
<div>
    <a href="<@ofbizUrl>setCustomer</@ofbizUrl>"<#if callSubmitForm??> onclick="javascript:submitForm(document.${parameters.formNameValue!});"</#if>>Personal Info</a>
    <#if (enableShippingAddress)??>
        <a href="<@ofbizUrl>setShipping</@ofbizUrl>" class="${styles.link_action_session!} ${styles.action_update!}"<#if callSubmitForm??> onclick="javascript:submitForm(document.${parameters.formNameValue!});"</#if>>Shipping Address</a>
    <#else>
        <span class="${styles.link_action_session!} ${styles.action_update!} ${styles.disabled!}">Shipping Address</span>
    </#if>
    <#if (enableShipmentMethod)??>
        <a href="<@ofbizUrl>setShipOptions</@ofbizUrl>"class="${styles.link_action_session!} ${styles.action_update!}"<#if callSubmitForm??> onclick="javascript:submitForm(document.${parameters.formNameValue!});"</#if>>Shipping Options</a>
    <#else>
        <span class="${styles.link_action_session!} ${styles.action_update!} ${styles.disabled!}">Shipping Options</span>
    </#if>
    <#if (enablePaymentOptions)??>
        <a href="<@ofbizUrl>setPaymentOption</@ofbizUrl>"class="${styles.link_action_session!} ${styles.action_update!}"<#if callSubmitForm??> onclick="javascript:submitForm(document.${parameters.formNameValue!});"</#if>>Payment Options</a>
    <#else>
        <span class="${styles.link_action_session!} ${styles.action_update!} ${styles.disabled!}">Payment Options</span>
    </#if>
    <#if (enablePaymentInformation)??>
        <a href="<@ofbizUrl>setPaymentInformation?paymentMethodTypeId=${requestParameters.paymentMethodTypeId!}</@ofbizUrl>" class="${styles.link_action_session!} ${styles.action_update!}"<#if callSubmitForm??> onclick="javascript:submitForm(document.${parameters.formNameValue!});"</#if>>Payment Information</a>
    <#else>
        <span class="${styles.link_action_session!} ${styles.action_update!} ${styles.disabled!}">Payment Information</span>
    </#if>
    <#if (enableReviewOrder)??>
        <a href="<@ofbizUrl>reviewOrder</@ofbizUrl>" class="${styles.link_action_session!} ${styles.action_update!}"<#if callSubmitForm??> onclick="javascript:submitForm(document.${parameters.formNameValue!});"</#if>>Review Order</a>
    <#else>
        <span class="${styles.link_action_session!} ${styles.action_update!} ${styles.disabled!}">Review Order</span>
    </#if>
</div>
