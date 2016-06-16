<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SectionKendoGrid.aspx.cs" Inherits="WebApplication1.AdminModule.Section" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="example">
    <div id="grid"></div>
    <script>
        $(document).ready(function () {
            $("#grid").kendoGrid({
                theme: "bootstrap",
                dataSource: {
                    serverSorting: true,
                    serverPaging: true,
                    serverFiltering: true,
                    pageSize: 10,
                    schema: {
                        type: "xml",
                        data: "/sections/section",
                        model: {
                            fields: {
                                user: "user/name/text()",
                                course: "course/name/text()",
                                sec_no: "sec_no/text()",
                                semester: "semester/name/text()",
                            }
                        }
                    },
                    batch: true,
                    transport: {
                        read: {
                            url: "SectionService.asmx/GetSection", 
                            type: "POST",
                            dataType: "xml",
                        },
                    }
                },
                height: 550,
                groupable: true,
                sortable: true,
                pageable: {
                    refresh: true,
                    pageSizes: true,
                    buttonCount: 5
                },
                toolbar: ["create"],
                columns: [{ field: "user", title: "Lecturer Name", width: 240 },
                    { field: "course", title: "Course" },
                    { field: "semester", title: "Semester" },
                    { field: "sec_no", title: "Section No", width: 150},
                    { command: ["edit", "delete"], title: "&nbsp;", width: "250px" }],
                editable: "inline"
            });
        });
    </script>
</div>
</asp:Content>
