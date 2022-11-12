<%@ Page Title="Self Assessment Form" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AddAppointment.aspx.cs" Inherits="Patient.AddAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>


    <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
        <!--begin::Post-->
        <div class="content flex-row-fluid" id="kt_content">
            <!--begin::Careers - Apply-->
            <div class="card">
                <!--begin::Body-->
                <div class="card-body p-lg-17">
                    <div class="position-relative mb-17">
                        <!--begin::Overlay-->
                        <div class="overlay overlay-show">
                            <!--begin::Image-->
                            <div class="bgi-no-repeat bgi-position-center bgi-size-cover card-rounded min-h-250px" style="background-image: url('assets/media/stock/1600x800/img-1.jpg')"></div>
                            <!--end::Image-->
                            <!--begin::layer-->
                            <div class="overlay-layer rounded bg-black" style="opacity: 0.4"></div>
                            <!--end::layer-->
                        </div>
                        <!--end::Overlay-->
                        <!--begin::Heading-->
                        <div class="position-absolute text-white mb-8 ms-10 bottom-0">
                            <!--begin::Title-->
                            <h3 class="text-white fs-2qx fw-bold mb-3 m">Patient Health Questionnaire</h3>
                            <!--end::Title-->
                            <!--begin::Text-->
                            <div class="fs-5 fw-semibold">You sit down. You stare at your screen. The cursor blinks.</div>
                            <!--end::Text-->
                        </div>
                        <!--end::Heading-->
                    </div>

                    <!--begin::1question-->
                    <asp:Repeater ID="rpAssessment" runat="server" OnPreRender="rpAssessment_PreRender" >
                        <ItemTemplate>
                            <div class="container">
                                <span class="fs-1qx fw-bold mb-3 m" style="font-size: 22px">
                                    <asp:Label ID="lblQuestionNumber" runat="server"></asp:Label>
                                    of 9</span>
                                <br /> <br />
                                <asp:HiddenField ID="hdfAssessmentQuestionsId" runat="server" Value='<%#Eval("AssessmentQuestionsId") %>' />
                                <span class="fs-1qx fw-bold mb-4 m" style="font-size: 16px">
                                    <asp:Label ID="lblQuestion" runat="server" Text='<%#Eval("Question") %>'></asp:Label>
                                </span>
                           
                            <div class="form-check form-check-custom form-check-solid my-2">
                                <asp:RadioButtonList ID="rdAnswer" RepeatLayout="Flow" RepeatDirection="Vertical" runat="server" >
                                    
                                </asp:RadioButtonList>

                            </div>
                                 </div>
                            <br /><br />
                        </ItemTemplate>
                    </asp:Repeater>


<%--                    <div class="container">
                        <span class="fs-1qx fw-bold mb-3 m" style="font-size: 22px">1 of 9</span>
                        <br>
                        <span class="fs-1qx fw-bold mb-4 m" style="font-size: 16px">Over the past 2 weeks, how often have you been bothered by any of the following problems: Little interest or pleasure in doing things?
                        </span>
                        <div class="form-check form-check-custom form-check-solid my-2">
                            <input class="form-check-input" type="radio" value="1" id="flexCheckDefault" />
                            <label class="form-check-label" for="flexCheckDefault">
                                Not At All
                            </label>
                        </div>

                        <div class="form-check form-check-custom form-check-solid my-2">
                            <input class="form-check-input" type="radio" value="1" id="flexCheckDefault" />
                            <label class="form-check-label" for="flexCheckDefault">
                                Several Days
                            </label>
                        </div>

                        <div class="form-check form-check-custom form-check-solid my-2">
                            <input class="form-check-input" type="radio" value="1" id="flexCheckDefault" />
                            <label class="form-check-label" for="flexCheckDefault">
                                More Than Half the Days
                            </label>
                        </div>

                        <div class="form-check form-check-custom form-check-solid">
                            <input class="form-check-input" type="radio" value="1" id="flexCheckDefault" />
                            <label class="form-check-label" for="flexCheckDefault">
                                Nearly Every Day
                            </label>
                        </div>
                    </div>--%>
                    <!--end::1question-->

                </div>

                <div style="text-align: center">
                    <asp:Button id="btnSubmit" runat="server" Text="Submit" class="btn btn-bg-smorange btn-color-white mb-13" OnClick="btnSubmit_Click"/>

                    <br />
                    <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                      <br />
                      <br />
                </div>
                <!--end::Body-->
            </div>
            <!--end::Careers - Apply-->
        </div>
        <!--end::Post-->
    </div>
                    </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
