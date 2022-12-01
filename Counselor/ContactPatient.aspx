<%@ Page Title="Contact Patient" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ContactPatient.aspx.cs" Inherits="Counselor.ContactPatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <!--begin::Container-->
            <div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
                <!--begin::Post-->
                <div class="content flex-row-fluid" id="kt_content">

                    <div class="bg-white card-rounded d-flex flex-column py-7 h-100 mb-10">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <span class="fw-bold fs-5 mb-1">Patient Name:</span>
                                    <span class="fw-bold fs-5 mb-1"><asp:Label ID="lblPatientName" runat="server"></asp:Label></span>
                                </div>
                                <div class="col">
                                    <div class="float-end">
                                        <span class="fw-bold fs-5 mb-1">Appointment Date:</span>
                                        <span class="fw-bold fs-5 mb-1"><asp:Label ID="lblAssessmentDate" runat="server"></asp:Label></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!--begin::Contact-->
                    <div class="card">
                        <!--begin::Body-->
                        <div class="card-body p-lg-10">
                            <div class="row mb-3">
                                    <!--begin::Form-->
                                    <form action="" class="form mb-15" method="post" id="kt_contact_form">
                                        <div class="row mb-5">
                                            <!--begin::Col-->
                                            <div class="fv-row">
                                                <!--end::Label-->
                                                <label class="fs-5 fw-semibold mb-2">Patient Email</label>
                                                <!--end::Label-->
                                                <!--end::Input-->
                                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" name="email" autocomplete="off" Enabled="false" CssClass="form-control form-control-solid" ></asp:TextBox>
                                                <!--end::Input-->
                                            </div>
                                            <!--end::Col-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Input group-->
                                        <div class="d-flex flex-column mb-5 fv-row">
                                            <!--begin::Label-->
                                            <label class="fs-5 fw-semibold mb-2">Subject</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <asp:TextBox ID="txtSubject" runat="server"  CssClass="form-control form-control-solid" ></asp:TextBox>
                                          
                                            <!--end::Input-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Input group-->
                                        <div class="d-flex flex-column mb-10 fv-row">
                                            <label class="fs-6 fw-semibold mb-2">Description</label>
                                            <asp:textbox ID="kt_docs_ckeditor_classic" runat="server" TextMode="MultiLine" form="Feedback_Form" name="kt_docs_ckeditor_classic" maxlength="1200" lines="10" cols="10" wrap="true"  />
<!--                                            <textarea class="form-control form-control-solid" rows="6" name="message" placeholder=""></textarea>-->
                                        </div>
                                        <!--end::Input group-->
                                        <!--begin::Submit-->
                                        <div class="container" style="text-align: center">
                                            <asp:Button id="btnSendEmail" runat="server" OnClick="btnSendEmail_Click" class="btn btn-primary" Text="Submit"/>
                                             <br />
                                            <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                                                
                                            <!--end::Submit-->
                                        </div>

                                    </form>
                                    <!--end::Form-->
                                </div>
                            <!--end::Card-->
                        </div>
                        <!--end::Body-->
                    </div>
                    <!--end::Contact-->
                </div>
                <!--end::Post-->
            </div>
            <!--end::Container-->

<!--begin::Custom Javascript(used by this page)-->
<script src="assets/plugins/custom/ckeditor/ckeditor-classic.bundle.js"></script>

<script>
    ClassicEditor
        .create(document.querySelector('#kt_docs_ckeditor_classic'))
        .then(editor => {
            console.log(editor);
        })
        .catch(error => {
            console.error(error);
        });

</script>



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
