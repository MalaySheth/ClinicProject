<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddPatient.aspx.cs" Inherits="Manager.AddPatient" %>
<!--begin::First Container-->
<div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
  <!--begin::Post-->
  <div class="content flex-row-fluid pb-1" id="kt_content">

    <div class="col-xl-12">
      <!--begin::Search Engine Fourth Container-->
      <div class="card mb-10">
        <!--begin::Header-->
        <div class="card-header border-0 pt-5">
          <h3 class="card-title align-items-start flex-column">
            <span class="card-label fw-bold fs-1 mb-1">Add New Patient</span>
          </h3>
        </div>
        <!--end::Header-->
        <!--begin::Body-->
        <div class="container">
          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Full Name</span>
            <asp:TextBox ID="txtFullName" runat="server" class="form-control" aria-describedby="basic-addon3"/>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Email</span>
            <asp:TextBox ID="txtEmail" runat="server"class="form-control" aria-describedby="basic-addon3"/>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Address</span>
            <asp:TextBox ID="txtAddress" runat="server" class="form-control" aria-describedby="basic-addon3"/>
          </div>
          <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Postcode</span>
            <asp:TextBox ID="txtPostCode" runat="server" class="form-control" aria-describedby="basic-addon3"/>
          </div>
          <!--end::Input group-->

            <!--begin::Input group-->
            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Phone Number</span>
                <asp:TextBox ID="txtPhoneNumber" runat="server" class="form-control" aria-describedby="basic-addon3"/>
            </div>
            <!--end::Input group-->

          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="txtBirthDatespan" style="width: 18%">Date of Birth</span>
            <asp:TextBox ID="txtDateOfBirth" runat="server" class="form-control" id="txtBirthDate" aria-describedby="birthDate"/>
          </div>
          <!--end::Input group-->
          <!--begin::Input group-->
          <div class="input-group mb-5">
            <span class="input-group-text" id="basic-addon3" style="width: 18%">Password</span>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" AutoCompleteType="None" class="form-control" aria-describedby="basic-addon3"/>
          </div>

            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Confirm Password</span>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" AutoCompleteType="None" class="form-control" aria-describedby="basic-addon3"/>
            </div>

            <div class="input-group mb-5">
                <span class="input-group-text" id="basic-addon3" style="width: 18%">Creation Date</span>
                <asp:TextBox ID="txtCreationDate" runat="server" class="form-control"  aria-describedby="basic-addon3"/>
            </div>
          <!--end::Input group-->

          <!--begin::Input group-->
<!--          <div class="input-group mb-5">-->
<!--            <span class="input-group-text" id="basic-addon3" style="width: 18%">Country</span>-->
<!--            <select class="form-control"   style=" border-radius: 0px 10px 10px 0px;"   data-control="select2" data-placeholder="In Progress" data-hide-search="true" data-select2-id="select2-data-10-usqa" tabindex="-1" aria-hidden="true" data-kt-initialized="1">-->
<!--              <option value="" data-select2-id="select2-data-207-1f9c">Select Country</option>-->
<!--              <option value="1" data-select2-id="select2-data-208-9hk7">China</option>-->
<!--              <option value="2" selected="selected" data-select2-id="select2-data-12-mjtv">USA</option>-->
<!--              <option value="3" data-select2-id="select2-data-209-g7bq">Europe</option>-->
<!--            </select>-->
<!--          </div>-->
          <!--end::Input group-->



        </div>
        <!--end::Body-->
      </div>
      <!--end::Search Engine Fourth Container-->


    </div>
  </div>
  <!--end::Post-->
</div>
<!--end::Container-->

<div style="text-align: center">
  <asp:Button ID="btnAddPatient" runat="server" OnClick="btnAddPatient_Click" class="btn btn-bg-smorange btn-color-white mb-13" Text="Add Patient" />
</div>
<!--end::Actions-->

<script>
    $("#txtBirthDate").flatpickr();
</script>

