<%@ Page Title="Self Assessment" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ViewSelfAssessment.aspx.cs" Inherits="Counselor.ViewSelfAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--begin::Style-->
    <style type="text/css">
        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }



            .pagination-ys table > tbody > tr > td {
                display: inline;
            }

                .pagination-ys table > tbody > tr > td > a,
                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    color: #dd4814;
                    background-color: #ffffff;
                    border: 1px solid #dddddd;
                    margin-left: -1px;
                }

                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    margin-left: -1px;
                    z-index: 2;
                    color: #aea79f;
                    background-color: #f5f5f5;
                    border-color: #dddddd;
                    cursor: default;
                }

                .pagination-ys table > tbody > tr > td:first-child > a,
                .pagination-ys table > tbody > tr > td:first-child > span {
                    margin-left: 0;
                    border-bottom-left-radius: 4px;
                    border-top-left-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td:last-child > a,
                .pagination-ys table > tbody > tr > td:last-child > span {
                    border-bottom-right-radius: 4px;
                    border-top-right-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td > a:hover,
                .pagination-ys table > tbody > tr > td > span:hover,
                .pagination-ys table > tbody > tr > td > a:focus,
                .pagination-ys table > tbody > tr > td > span:focus {
                    color: #97310e;
                    background-color: #eeeeee;
                    border-color: #dddddd;
                }
    </style>
    <!--end::Style-->


    <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">

        <!--begin::Post-->
        <div class="content flex-row-fluid" id="kt_content">

            <div class="col-xl-12">
                <!--begin::Search Engine Fourth Container-->
                <div class="card mb-10">
                    <!--begin::Header-->
                    <div class="card-header border-0 py-5 ">
                        <h3 class="card-title align-items-start flex-column">
                            <span class="card-label fw-bold fs-2 mb-1">Assesment Result</span>
                        </h3>
                    </div>
                    <!--end::Header-->
                    <!--begin::Body-->
                    <div class="container mb-5">
                        <div class="row">
                            <div class="col">
                                <span class="fw-bold fs-5 mb-1">Patient Name:</span>
                                <span class="fw-bold fs-5 mb-1"><asp:Label ID="lblPatientName" runat="server"></asp:Label></span>
                            </div>
                            <div class="col">
                                <div class="float-end">
                                    <span class="fw-bold fs-5 mb-1">Assesment Date:</span>
                                    <span class="fw-bold fs-5 mb-1"><asp:Label ID="lblAssessmentDate" runat="server"></asp:Label></span>
                                </div>

                            </div>
                        </div>
                    </div>
                    <center>
                    <asp:GridView ID="gvPatientAssessment" Width="90%" runat="server" AutoGenerateColumns="False" CellPadding="4" BorderStyle="None" EnableModelValidation="True" ForeColor="#333333" DataKeyNames="PatientAppointmentAssessmentId" CssClass="table table-striped nowrap paginate_button page-item active" AllowPaging="True" PageSize="10"   EmptyDataText="No Assessment Found!">
                        <Columns>

                            <asp:TemplateField HeaderText="Question No.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Question" HeaderText="Question" />
                            <asp:BoundField DataField="Answer" HeaderText="Answer" />


                        </Columns>
                        <PagerStyle CssClass="pagination-ys" />
                        <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Prev" PageButtonCount="6" Position="Bottom" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#0cb6b9" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" />
                        <EmptyDataRowStyle HorizontalAlign="Center" />


                    </asp:GridView>
                        </center>

                    <!--end::Body-->
                </div>
                <!--end::Search Engine Fourth Container-->


            </div>
        </div>
        <!--end::Post-->
    </div>
</asp:Content>
