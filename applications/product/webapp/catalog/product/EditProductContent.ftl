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
<#if product??>
<@script>
    function insertNowTimestamp(field) {
        eval('document.productForm.' + field + '.value="${nowTimestampString}";');
    };
    function insertImageName(type,nameValue) {
        eval('document.productForm.' + type + 'ImageUrl.value=nameValue;');
    };
</@script>

    <#if fileType?has_content>
    <@heading>${uiLabelMap.ProductResultOfImageUpload}</@heading>
        <#if !(clientFileName?has_content)>
    <div>${uiLabelMap.ProductNoFileSpecifiedForUpload}.</div>
        <#else>
    <div>${uiLabelMap.ProductTheFileOnYourComputer}: <b>${clientFileName!}</b></div>
    <div>${uiLabelMap.ProductServerFileName}: <b>${fileNameToUse!}</b></div>
    <div>${uiLabelMap.ProductServerDirectory}: <b>${imageServerPath!}</b></div>
    <div>${uiLabelMap.ProductTheUrlOfYourUploadedFile}: <b><a href="<@ofbizContentUrl>${imageUrl!}</@ofbizContentUrl>">${imageUrl!}</a></b></div>
        </#if>
    <br />
    </#if>
    
    <@section>
        <form action="<@ofbizUrl>updateProductContent</@ofbizUrl>" method="post" name="productForm">
            <input type="hidden" name="productId" value="${productId!}"/>
            <@field type="generic" label="${uiLabelMap.ProductProductName}">
                <input type="text" name="productName" value="${(product.productName?html)!}" size="30" maxlength="60"/>
            </@field>
            <@field type="generic" label="${uiLabelMap.ProductProductDescription}">
                <textarea name="description" cols="60" rows="2">${(product.description)!}</textarea>
            </@field>
            <@field type="generic" label="${uiLabelMap.ProductLongDescription}">
                <textarea class="dojo-ResizableTextArea" name="longDescription" cols="60" rows="7">${(product.longDescription)!}</textarea>
            </@field>
            <@field type="generic" label="${uiLabelMap.ProductDetailScreen}">
                <input type="text" name="detailScreen" value="${(product.detailScreen)!}" size="60" maxlength="250"/>
                    <br /><span class="tooltip">${uiLabelMap.ProductIfNotSpecifiedDefaultsIsProductdetail} &quot;productdetail&quot;, ${uiLabelMap.ProductDetailScreenMessage}: &quot;component://ecommerce/widget/CatalogScreens.xml#productdetail&quot;</span>
            </@field>
            <#assign labelDetail>
              <#if (product.smallImageUrl)??>
                <a href="<@ofbizContentUrl>${(product.smallImageUrl)!}</@ofbizContentUrl>" target="_blank"><img alt="Small Image" src="<@ofbizContentUrl>${(product.smallImageUrl)!}</@ofbizContentUrl>" class="cssImgSmall"/></a>
              </#if>
            </#assign>
            <@field type="generic" label="${uiLabelMap.ProductSmallImage}" labelDetail=labelDetail>
                <input type="text" name="smallImageUrl" value="${(product.smallImageUrl)?default('')}" size="60" maxlength="255"/>
                  <#if productId?has_content>
                    <div>
                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
                        <a href="javascript:insertImageName('small','${imageNameSmall}.jpg');" class="${styles.link_action_local!} ${styles.action_add!}">.jpg</a>
                        <a href="javascript:insertImageName('small','${imageNameSmall}.gif');" class="${styles.link_action_local!} ${styles.action_add!}">.gif</a>
                        <a href="javascript:insertImageName('small','');" class="${styles.link_action_local!} ${styles.action_clear!}">${uiLabelMap.CommonClear}</a>
                    </div>
                  </#if>
            </@field>
            <#assign labelDetail>
              <#if (product.mediumImageUrl)??>
                <a href="<@ofbizContentUrl>${product.mediumImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Medium Image" src="<@ofbizContentUrl>${product.mediumImageUrl}</@ofbizContentUrl>" class="cssImgSmall"/></a>
              </#if>
            </#assign>
            <@field type="generic" label="${uiLabelMap.ProductMediumImage}" labelDetail=labelDetail>
                <input type="text" name="mediumImageUrl" value="${(product.mediumImageUrl)?default('')}" size="60" maxlength="255"/>
                  <#if productId?has_content>
                    <div>
                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
                        <a href="javascript:insertImageName('medium','${imageNameMedium}.jpg');" class="${styles.link_action_local!} ${styles.action_add!}">.jpg</a>
                        <a href="javascript:insertImageName('medium','${imageNameMedium}.gif');" class="${styles.link_action_local!} ${styles.action_add!}">.gif</a>
                        <a href="javascript:insertImageName('medium','');" class="${styles.link_action_local!} ${styles.action_clear!}">${uiLabelMap.CommonClear}</a>
                    </div>
                  </#if>
            </@field>
            <#assign labelDetail>
              <#if (product.largeImageUrl)??>
                <a href="<@ofbizContentUrl>${product.largeImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Large Image" src="<@ofbizContentUrl>${product.largeImageUrl}</@ofbizContentUrl>" class="cssImgSmall"/></a>
              </#if>
            </#assign>
            <@field type="generic" label="${uiLabelMap.ProductLargeImage}" labelDetail=labelDetail>
                <input type="text" name="largeImageUrl" value="${(product.largeImageUrl)?default('')}" size="60" maxlength="255"/>
                  <#if productId?has_content>
                    <div>
                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
                        <a href="javascript:insertImageName('large','${imageNameLarge}.jpg');" class="${styles.link_action_local!} ${styles.action_add!}">.jpg</a>
                        <a href="javascript:insertImageName('large','${imageNameLarge}.gif');" class="${styles.link_action_local!} ${styles.action_add!}">.gif</a>
                        <a href="javascript:insertImageName('large','');" class="${styles.link_action_local!} ${styles.action_clear!}">${uiLabelMap.CommonClear}</a>
                    </div>
                  </#if>
            </@field>
            <#assign labelDetail>
              <#if (product.detailImageUrl)??>
                <a href="<@ofbizContentUrl>${product.detailImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Detail Image" src="<@ofbizContentUrl>${product.detailImageUrl}</@ofbizContentUrl>" class="cssImgSmall"/></a>
              </#if>
            </#assign>
            <@field type="generic" label="${uiLabelMap.ProductDetailImage}" labelDetail=labelDetail>
                <input type="text" name="detailImageUrl" value="${(product.detailImageUrl)?default('')}" size="60" maxlength="255"/>
                  <#if productId?has_content>
                    <div>
                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
                        <a href="javascript:insertImageName('detail','${imageNameDetail}.jpg');" class="${styles.link_action_local!} ${styles.action_add!}">.jpg</a>
                        <a href="javascript:insertImageName('detail','${imageNameDetail}.gif');" class="${styles.link_action_local!} ${styles.action_add!}">.gif</a>
                        <a href="javascript:insertImageName('detail','');" class="${styles.link_action_local!} ${styles.action_clear!}">${uiLabelMap.CommonClear}</a>
                    </div>
                  </#if>
            </@field>
            <#assign labelDetail>
                  <#if (product.originalImageUrl)??>
                    <a href="<@ofbizContentUrl>${product.originalImageUrl}</@ofbizContentUrl>" target="_blank"><img alt="Original Image" src="<@ofbizContentUrl>${product.originalImageUrl}</@ofbizContentUrl>" class="cssImgSmall"/></a>
                  </#if>
            </#assign>
            <@field type="generic" label="${uiLabelMap.ProductOriginalImage}" labelDetail=labelDetail>
                <input type="text" name="originalImageUrl" value="${(product.originalImageUrl)?default('')}" size="60" maxlength="255"/>
                  <#if productId?has_content>
                    <div>
                        <span>${uiLabelMap.ProductInsertDefaultImageUrl}: </span>
                        <a href="javascript:insertImageName('original','${imageNameOriginal}.jpg');" class="${styles.link_action_local!} ${styles.action_add!}">.jpg</a>
                        <a href="javascript:insertImageName('original','${imageNameOriginal}.gif');" class="${styles.link_action_local!} ${styles.action_add!}">.gif</a>
                        <a href="javascript:insertImageName('original','');" class="${styles.link_action_local!} ${styles.action_clear!}">${uiLabelMap.CommonClear}</a>
                    </div>
                  </#if>
            </@field>
            <@field type="submitarea">
                <input type="submit" name="Update" value="${uiLabelMap.CommonUpdate}" class="${styles.link_action_sys!} ${styles.action_update!}"/>
            </@field>
        </form>
        <@script>
            function setUploadUrl(newUrl) {
                var toExec = 'document.imageUploadForm.action="' + newUrl + '";';
                eval(toExec);
            };
        </@script>
    </@section>
    
    <@section title="${uiLabelMap.ProductUploadImage}">
        <form method="post" enctype="multipart/form-data" action="<@ofbizUrl>UploadProductImage?productId=${productId}&amp;upload_file_type=original</@ofbizUrl>" name="imageUploadForm">
          <@fields type="default-nolabels">
            <@field type="file" size="50" name="fname"/>
            <@field type="generic">
                <input type="radio" name="upload_file_type_bogus" value="small" onclick='setUploadUrl("<@ofbizUrl>UploadProductImage?productId=${productId}&amp;upload_file_type=small</@ofbizUrl>");'/>${uiLabelMap.CommonSmall}
                <input type="radio" name="upload_file_type_bogus" value="medium" onclick='setUploadUrl("<@ofbizUrl>UploadProductImage?productId=${productId}&amp;upload_file_type=medium</@ofbizUrl>");'/>${uiLabelMap.CommonMedium}
                <input type="radio" name="upload_file_type_bogus" value="large"onclick='setUploadUrl("<@ofbizUrl>UploadProductImage?productId=${productId}&amp;upload_file_type=large</@ofbizUrl>");'/>${uiLabelMap.CommonLarge}
                <input type="radio" name="upload_file_type_bogus" value="detail" onclick='setUploadUrl("<@ofbizUrl>UploadProductImage?productId=${productId}&amp;upload_file_type=detail</@ofbizUrl>");'/>${uiLabelMap.CommonDetail}
                <input type="radio" name="upload_file_type_bogus" value="original" checked="checked" onclick='setUploadUrl("<@ofbizUrl>UploadProductImage?productId=${productId}&amp;upload_file_type=original</@ofbizUrl>");'/>${uiLabelMap.ProductOriginal}
            </@field>
            <@field type="submitarea">
                <input type="submit" class="${styles.link_action_sys!} ${styles.action_import!}" value="${uiLabelMap.ProductUploadImage}"/>
            </@field>
            <#-- FIXME -->
            <span class="tooltip">${uiLabelMap.ProductOriginalImageMessage} : {ofbiz.home}/applications/product/config/ImageProperties.xml&quot;</span>
          </@fields>
        </form>
    </@section>
</#if>
