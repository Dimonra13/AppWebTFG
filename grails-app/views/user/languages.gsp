<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="HeaderFooter"/>
    <title><g:message code="title.languages"/></title>
</head>
<!-- Body-->
<body>
<div class="container pt-lg-3 pb-5 mb-sm-5">
    <g:set var="lanList" value="${["English",
                                   "Spanish",
                                   "German",
                                   "Portuguese",
                                   "Romanian",
                                   "Arabic",
                                   "Italian",
                                   "Hungarian",
                                   "French",
                                   "Persian",
                                   "Turkish",
                                   "Indonesian",
                                   "Japanese",
                                   "Polish",
                                   "Hindi",
                                   "Russian",
                                   "Vietnamese",
                                   "Thai",
                                   "Dutch",
                                   "Kazakh",
                                   "Chinese",
                                   "Hebrew",
                                   "Urdu",
                                   "Bengali",
                                   "Tamil",
                                   "Telugu",
                                   "Norwegian",
                                   "Korean",
                                   "Czech",
                                   "Greek",
                                   "Burmese",
                                   "Serbian",
                                   "Finnish",
                                   "Filipino",
                                   "Pashto",
                                   "Malayalam",
                                   "Croatian",
                                   "Kannada",
                                   "Danish",
                                   "Marathi",
                                   "Azeri",
                                   "Georgian",
                                   "Afrikaans",
                                   "Bulgarian",
                                   "Ukrainian",
                                   "Slovenian",
                                   "Punjabi",
                                   "Mongolian",
                                   "Swahili",
                                   "Catalan",
                                   "Albanian",
                                   "Slovak",
                                   "Somali",
                                   "Irish",
                                   "Estonian",
                                   "Uzbek",
                                   "Gujarati",
                                   "Lithuanian",
                                   "Latvian",
                                   "Armenian",
                                   "Swedish",
                                   "Kurdish",
                                   "Aymara",
                                   "Khmer",
                                   "Malay",
                                   "Nepali"]}"/>
    <div class="row">
        <!-- Featured products grid-->
        <section class="container px-3 pt-4 mt-3">
            <div class="row">
                <div class="col-md-9 pt-6 pt-sm-3 d-flex flex-wrap justify-content-between align-items-center pb-2">
                    <g:if test="${update}">
                        <h2 class="h3 mb-3"><g:message code="language.title.update"/></h2>
                    </g:if>
                    <g:else>
                        <h2 class="h3 mb-3"><g:message code="language.title"/></h2>
                    </g:else>
                    <p class="text-muted mb-4"><g:message code="language.explanation"/></p>
                </div>
                <div class="col-md-3 pt-2 pt-sm-2">
                    <div class="text-right">
                        <g:if test="${update}">
                            <a class="btn btn-outline-primary btn-sm" href="/user/myProfile/"><i class="mr-1" data-feather="chevrons-left"></i><g:message code="profile.image.back"></g:message></a>
                            <br><br>
                        </g:if>
                        <button onclick="selectAll()" class="btn btn-primary btn-sm btn-block select" type="button"><g:message code="language.select.all"/></button>
                        <button onclick="deselectAll()" class="btn btn-primary btn-sm btn-block select" type="button"><g:message code="language.deselect.all"/></button>
                        <br>
                    </div>
                </div>
            </div>
            <div class="col-md-12 pt-6 pt-sm-3">
                <div class="row no-gutters">
                <g:each var="language" in="${lanList}" status="i">
                    <!-- Product-->
                    <div class="col-lg-2 col-sm-4 col-6 border border-collapse">
                        <div class="product-card">
                            <div style="padding-top: 1rem;">
                                <h3 style="text-align: center;"><g:message code="language.${language}"/></h3>
                            </div>
                            <div class="product-thumb"><asset:image src="Languages/lan_${language}.jpg" style="height: 10rem;"/></div>
                            <div id="select-${language}" class="product-card-body">
                                <button onclick="addCategoryInput('${language}')" class="btn btn-primary btn-sm btn-block select" type="button" data-toggle="toast" data-target="#cart-toast"><g:message code="interest.select"/></button>
                            </div>
                            <div id="unselect-${language}" class="product-card-body">
                                <button onclick="removeCategoryInput('${language}')" class="btn btn-outline-primary btn-sm btn-block select" type="button" data-toggle="toast" data-target="#cart-toast"><g:message code="interest.unselect"/></button>
                            </div>
                        </div>
                    </div>
                </g:each>
                </div>
                <br>
            </div>
                <form name="imageSubmit" action="/user/updateLanguages">
                <input type="hidden" name="fromRegister" value="${fromRegister}">
                <div class="text-right">
                    <g:if test="${!update}">
                        <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'language.submit')}"/>
                    </g:if>
                    <g:else>
                        <input type="submit" class="btn btn-primary" name="submit" value="${message(code: 'language.update.submit')}"/>
                    </g:else>
                </div>
            </form>
        </section>
        <g:javascript>
            $(document).ready(function () {
                //Code used to hide the unselect buttons
                let catList = ["English",
            "Spanish",
            "German",
            "Portuguese",
            "Romanian",
            "Arabic",
            "Italian",
            "Hungarian",
            "French",
            "Persian",
            "Turkish",
            "Indonesian",
            "Chinese",
            "Japanese",
            "Polish",
            "Hindi",
            "Russian",
            "Vietnamese",
            "Thai",
            "Dutch",
            "Kazakh",
            "Hebrew",
            "Urdu",
            "Bengali",
            "Tamil",
            "Telugu",
            "Norwegian",
            "Korean",
            "Czech",
            "Greek",
            "Burmese",
            "Serbian",
            "Finnish",
            "Filipino",
            "Pashto",
            "Malayalam",
            "Croatian",
            "Kannada",
            "Danish",
            "Marathi",
            "Azeri",
            "Georgian",
            "Afrikaans",
            "Bulgarian",
            "Ukrainian",
            "Slovenian",
            "Punjabi",
            "Mongolian",
            "Swahili",
            "Catalan",
            "Albanian",
            "Slovak",
            "Somali",
            "Irish",
            "Estonian",
            "Uzbek",
            "Gujarati",
            "Lithuanian",
            "Latvian",
            "Armenian",
            "Swedish",
            "Kurdish",
            "Aymara",
            "Khmer",
            "Malay",
            "Nepali"]
                catList.forEach(it => {
                    $('#unselect-' + it).hide()
                })
                /*Code used to auto-select the categories the user have previously selected,
                  necesary to allow users to edit their interests
                 */
                let userInterests = []
                <g:each var="language" in="${userLanguages}">
                userInterests.push('${language}')
                </g:each>
                userInterests.forEach(it => {
                    addCategoryInput(it)
                })
            });

let languageList = ["English",
            "Spanish",
            "German",
            "Portuguese",
            "Romanian",
            "Arabic",
            "Italian",
            "Hungarian",
            "French",
            "Persian",
            "Turkish",
            "Indonesian",
            "Chinese",
            "Japanese",
            "Polish",
            "Hindi",
            "Russian",
            "Vietnamese",
            "Thai",
            "Dutch",
            "Kazakh",
            "Hebrew",
            "Urdu",
            "Bengali",
            "Tamil",
            "Telugu",
            "Norwegian",
            "Korean",
            "Czech",
            "Greek",
            "Burmese",
            "Serbian",
            "Finnish",
            "Filipino",
            "Pashto",
            "Malayalam",
            "Croatian",
            "Kannada",
            "Danish",
            "Marathi",
            "Azeri",
            "Georgian",
            "Afrikaans",
            "Bulgarian",
            "Ukrainian",
            "Slovenian",
            "Punjabi",
            "Mongolian",
            "Swahili",
            "Catalan",
            "Albanian",
            "Slovak",
            "Somali",
            "Irish",
            "Estonian",
            "Uzbek",
            "Gujarati",
            "Lithuanian",
            "Latvian",
            "Armenian",
            "Swedish",
            "Kurdish",
            "Aymara",
            "Khmer",
            "Malay",
            "Nepali"]

            function selectAll(){
                languageList.forEach(it => {
                    addCategoryInput(it)
                })
            }

            function deselectAll(){
                languageList.forEach(it => {
                    removeCategoryInput(it)
                })
            }

            function addCategoryInput(id) {
                if (id != '' && !document.getElementById('input_' + id)) {
                    var categoryInput = document.createElement('input');
                    categoryInput.type = 'hidden';
                    categoryInput.id = 'input_' + id;
                    categoryInput.name = 'languages[]';
                    categoryInput.value = id;
                    document.imageSubmit.appendChild(categoryInput);
                    $('#select-' + id).hide()
                    $('#unselect-' + id).show()
                }
            }

            function removeCategoryInput(id) {
                if (id != '' && document.getElementById('input_' + id)) {
                    $('#input_' + id).remove()
                    $('#unselect-' + id).hide()
                    $('#select-' + id).show()
                }
            }
        </g:javascript>
    </div>
</div>

</body>
</html>