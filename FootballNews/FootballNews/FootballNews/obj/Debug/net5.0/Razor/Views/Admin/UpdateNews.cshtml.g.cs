#pragma checksum "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7a02a49abd7147c30f1487513db775d5936869b6"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Admin_UpdateNews), @"mvc.1.0.view", @"/Views/Admin/UpdateNews.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\_ViewImports.cshtml"
using FootballNews;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\_ViewImports.cshtml"
using FootballNews.Models;

#line default
#line hidden
#nullable disable
#nullable restore
#line 1 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
using Newtonsoft.Json;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"7a02a49abd7147c30f1487513db775d5936869b6", @"/Views/Admin/UpdateNews.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"59d055044b75d38e2aad48a085137313cbf461f9", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Admin_UpdateNews : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("action", new global::Microsoft.AspNetCore.Html.HtmlString("addNews"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("method", "POST", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n<!DOCTYPE html>\r\n<html>\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("head", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "7a02a49abd7147c30f1487513db775d5936869b64766", async() => {
                WriteLiteral(@"
    <meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8"">
    <title>Update News</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #d8302f;
        }

        * {
            box-sizing: border-box;
        }

        .form-add {
            width: 50%;
            margin: 0 auto;
        }

            .form-add h3 {
                text-align: center;
                font-size: 40px;
                color: #fff;
            }

        input[type=text], [type=date],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }

        input[type=submit] {
            background-color: #0275d8;
            color: white;
            padding: 12px 20px;
      ");
                WriteLiteral(@"      border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            input[type=submit]:hover {
                background-color: #1977c9;
            }

        input[type=button] {
            background-color: #d8302f;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            input[type=button]:hover {
                background-color: #bd3535;
            }

        .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }
    </style>
");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("body", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "7a02a49abd7147c30f1487513db775d5936869b67477", async() => {
                WriteLiteral("\r\n");
#nullable restore
#line 78 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
      
        User CurrentUser = JsonConvert.DeserializeObject<User>(Context.Session.GetString("CurrentUser"));
    

#line default
#line hidden
#nullable disable
                WriteLiteral("    <div class=\"form-add\">\r\n        <h3>Add News</h3>\r\n\r\n        <div class=\"container\">\r\n            ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "7a02a49abd7147c30f1487513db775d5936869b68171", async() => {
                    WriteLiteral("\r\n                <label");
                    BeginWriteAttribute("for", " for=\"", 2100, "\"", 2106, 0);
                    EndWriteAttribute();
                    WriteLiteral(">Title</label>\r\n                <input");
                    BeginWriteAttribute("value", " value=\"", 2145, "\"", 2153, 0);
                    EndWriteAttribute();
                    WriteLiteral(" type=\"text\" name=\"Title\" placeholder=\"Enter title..\" required>\r\n\r\n                <label");
                    BeginWriteAttribute("for", " for=\"", 2243, "\"", 2249, 0);
                    EndWriteAttribute();
                    WriteLiteral(">Short Description</label>\r\n                <textarea");
                    BeginWriteAttribute("value", " value=\"", 2303, "\"", 2311, 0);
                    EndWriteAttribute();
                    WriteLiteral(" name=\"ShortDescription\" placeholder=\"Write something..\" style=\"height:100px\" required></textarea>\r\n\r\n                <label");
                    BeginWriteAttribute("for", " for=\"", 2436, "\"", 2442, 0);
                    EndWriteAttribute();
                    WriteLiteral(">Thumbnail</label><br><br>\r\n                <input");
                    BeginWriteAttribute("value", " value=\"", 2493, "\"", 2501, 0);
                    EndWriteAttribute();
                    WriteLiteral(" type=\"file\" name=\"Thumbnail\" placeholder=\"Enter url img..\" required><br><br>\r\n\r\n                <label");
                    BeginWriteAttribute("for", " for=\"", 2605, "\"", 2611, 0);
                    EndWriteAttribute();
                    WriteLiteral(">Type News</label>\r\n                <select name=\"Category\">\r\n");
#nullable restore
#line 97 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
                     foreach (Category c in ViewBag.AllCategories)
                   {

#line default
#line hidden
#nullable disable
                    WriteLiteral("                       ");
                    __tagHelperExecutionContext = __tagHelperScopeManager.Begin("option", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "7a02a49abd7147c30f1487513db775d5936869b610484", async() => {
#nullable restore
#line 99 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
                                                Write(c.CategoryName);

#line default
#line hidden
#nullable disable
                    }
                    );
                    __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.OptionTagHelper>();
                    __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper);
                    BeginWriteTagHelperAttribute();
#nullable restore
#line 99 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
                          WriteLiteral(c.CategoryId);

#line default
#line hidden
#nullable disable
                    __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
                    __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value = __tagHelperStringValueBuffer;
                    __tagHelperExecutionContext.AddTagHelperAttribute("value", __Microsoft_AspNetCore_Mvc_TagHelpers_OptionTagHelper.Value, global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
                    await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                    if (!__tagHelperExecutionContext.Output.IsContentModified)
                    {
                        await __tagHelperExecutionContext.SetOutputContentAsync();
                    }
                    Write(__tagHelperExecutionContext.Output);
                    __tagHelperExecutionContext = __tagHelperScopeManager.End();
                    WriteLiteral("\r\n");
#nullable restore
#line 100 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
                   }

#line default
#line hidden
#nullable disable
                    WriteLiteral("                </select>\r\n\r\n                <input id=\"addMore\" type=\"button\" value=\"Add More Image/Content\" style=\"background-color: #5cb85c;\"><br><br>\r\n\r\n                <label");
                    BeginWriteAttribute("for", " for=\"", 3044, "\"", 3050, 0);
                    EndWriteAttribute();
                    WriteLiteral(">Image</label><br><br>\r\n                <input");
                    BeginWriteAttribute("value", " value=\"", 3097, "\"", 3105, 0);
                    EndWriteAttribute();
                    WriteLiteral(" type=\"file\" name=\"Image\" placeholder=\"Enter url img..\" required><br><br>\r\n\r\n                <label");
                    BeginWriteAttribute("for", " for=\"", 3205, "\"", 3211, 0);
                    EndWriteAttribute();
                    WriteLiteral(">Content</label>\r\n                <textarea");
                    BeginWriteAttribute("value", " value=\"", 3255, "\"", 3263, 0);
                    EndWriteAttribute();
                    WriteLiteral(" id=\"below\" name=\"Content\" placeholder=\"Write something..\" style=\"height:100px\" required></textarea>\r\n\r\n");
#nullable restore
#line 111 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
                 if (CurrentUser.RoleId == 1)
                {

#line default
#line hidden
#nullable disable
                    WriteLiteral("                    <a href=\"/Admin/ManageNews\"><input type=\"button\" value=\"Cancel\" style=\"float: left;\"></a>\r\n                    <input type=\"submit\" value=\"Update News\" style=\"float: right;\">\r\n");
#nullable restore
#line 115 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
                }

#line default
#line hidden
#nullable disable
#nullable restore
#line 116 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
                  if (CurrentUser.RoleId == 2)
                {

#line default
#line hidden
#nullable disable
                    WriteLiteral("                    <a href=\"/Author/MyNews\"><input type=\"button\" value=\"Cancel\" style=\"float: left;\"></a>\r\n                    <input type=\"submit\" value=\"Update News\" style=\"float: right;\">\r\n");
#nullable restore
#line 120 "D:\FootballNews\FootballNews\FootballNews\FootballNews\Views\Admin\UpdateNews.cshtml"
                }

#line default
#line hidden
#nullable disable
                    WriteLiteral("\r\n                <div style=\"clear: both;\">\r\n                </div>\r\n            ");
                }
                );
                __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
                __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper.Method = (string)__tagHelperAttribute_1.Value;
                __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_1);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n        </div>\r\n    </div>\r\n\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n</html>\r\n\r\n");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
