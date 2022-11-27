<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Manager.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!--begin::Toolbar-->
					<div class="toolbar d-flex flex-stack mb-0 mb-lg-n4 pt-5" id="kt_toolbar">
						<!--begin::Container-->
						<div id="kt_toolbar_container" class="container-xxl d-flex flex-stack flex-wrap">
							<!--begin::Page title-->
							<div class="page-title d-flex flex-column me-3">
								<!--begin::Title-->
								<h1 class="d-flex text-dark fw-bold my-1 fs-3">Manager Dashboard</h1>
								<!--end::Title-->
								<!--begin::Breadcrumb-->
								<ul class="breadcrumb breadcrumb-dot fw-semibold text-gray-600 fs-7 my-1">
									<!--begin::Item-->
									<li class="breadcrumb-item text-gray-600">
										<a href="../../demo18/dist/index.html" class="text-gray-600 text-hover-primary">Home</a>
									</li>
									<!--end::Item-->
									<!--begin::Item-->
									<li class="breadcrumb-item text-gray-600">Dashboards</li>
									<!--end::Item-->
									<!--begin::Item-->
									<li class="breadcrumb-item text-gray-500">Projects</li>
									<!--end::Item-->
								</ul>
								<!--end::Breadcrumb-->
							</div>
							<!--end::Page title-->
						</div>
						<!--end::Container-->
					</div>
					<!--end::Toolbar-->
					<!--begin::Container-->
					<div id="kt_content_container" class="d-flex flex-column-fluid align-items-start container-xxl">
						<!--begin::Post-->
						<div class="content flex-row-fluid" id="kt_content">
							<!--begin::Row-->
							<div class="row">
								<div class="col-md-6">
									<!--begin::Card widget 3-->
									<div class="card card-flush bgi-no-repeat bgi-size-contain bgi-position-x-end h-xl-70" style="background-color: #F1416C;background-image:url('/assets/media/svg/shapes/wave-bg-red.svg')">
										<!--begin::Header-->
										<div class="card-header pt-5 mb-3">
											<!--begin::Icon-->
											<div class="d-flex flex-center rounded-circle h-80px w-80px" style="border: 1px dashed rgba(255, 255, 255, 0.4);background-color: #F1416C">
												<i class="fa fa-bed text-white fs-2qx lh-0"></i>
											</div>
											<!--end::Icon-->
										</div>
										<!--end::Header-->
										<!--begin::Card body-->
										<div class="card-body d-flex align-items-end mb-3">
											<!--begin::Info-->
											<div class="d-flex align-items-center">
												<asp:Label id="LblTotalPatients" class="fs-4hx text-white fw-bold me-6" runat="server"/>
												<div class="fw-bold fs-6 text-white">
													<span class="d-block">Total</span>
													<span class="">Patients</span>
												</div>
											</div>
											<!--end::Info-->
										</div>
										<!--end::Card body-->
									</div>
									<!--end::Card widget 3-->
								</div>

								<div class="col-md-6">
									<!--begin::Card widget 3-->
									<div class="card card-flush bgi-no-repeat bgi-size-contain bgi-position-x-end h-xl-100" style="background-color: #7239EA;background-image:url('/assets/media/svg/shapes/wave-bg-purple.svg')">
										<!--begin::Header-->
										<div class="card-header pt-5 mb-3">
											<!--begin::Icon-->
											<div class="d-flex flex-center rounded-circle h-80px w-80px" style="border: 1px dashed rgba(255, 255, 255, 0.4);background-color: #7239EA">
												<i class="fa fa-calendar-check text-white fs-2qx lh-0"></i>
											</div>
											<!--end::Icon-->
										</div>
										<!--end::Header-->
										<!--begin::Card body-->
										<div class="card-body d-flex align-items-end mb-3">
											<!--begin::Info-->
											<div class="d-flex align-items-center">
												<asp:Label id="LblTotalAppointments" class="fs-4hx text-white fw-bold me-6" runat="server"/>
												<div class="fw-bold fs-6 text-white">
													<span class="d-block">Total</span>
													<span class="">Appointments</span>
												</div>
											</div>
											<!--end::Info-->
										</div>
										<!--end::Card body-->
									</div>
									<!--end::Card widget 3-->
								</div>
							</div>
							<!--end::Row-->
							<!--begin::Row-->
							<div class="row mt-10">
								<div class="col-md-6">
									<!--begin::Card widget 3-->
									<div class="card card-flush bgi-no-repeat bgi-size-contain bgi-position-x-end h-xl-70" style="background-color: #f26522;background-image:url('/assets/media/svg/shapes/wave-bg-dark.svg')">
										<!--begin::Header-->
										<div class="card-header pt-5 mb-3">
											<!--begin::Icon-->
											<div class="d-flex flex-center rounded-circle h-80px w-80px" style="border: 1px dashed rgba(255, 255, 255, 0.4);background-color: #f26522">
												<i class="fa fa-hospital-user text-white fs-2qx lh-0"></i>
											</div>
											<!--end::Icon-->
										</div>
										<!--end::Header-->
										<!--begin::Card body-->
										<div class="card-body d-flex align-items-end mb-3">
											<!--begin::Info-->
											<div class="d-flex align-items-center">
												<asp:Label id="LblTotalCounselors" class="fs-4hx text-white fw-bold me-6" runat="server"/>
												<div class="fw-bold fs-6 text-white">
													<span class="d-block">Total</span>
													<span class="">Counselors</span>
												</div>
											</div>
											<!--end::Info-->
										</div>
										<!--end::Card body-->
									</div>
									<!--end::Card widget 3-->
								</div>

								<div class="col-md-6">
									<!--begin::Card widget 3-->
									<div class="card card-flush bgi-no-repeat bgi-size-contain bgi-position-x-end h-xl-100" style="background-color: #676766;background-image:url('/assets/media/svg/shapes/wave-bg-dark.svg')">
										<!--begin::Header-->
										<div class="card-header pt-5 mb-3">
											<!--begin::Icon-->
											<div class="d-flex flex-center rounded-circle h-80px w-80px" style="border: 1px dashed rgba(255, 255, 255, 0.4);background-color: #676766">
												<i class="fa fa-user-doctor text-white fs-2qx lh-0"></i>
											</div>
											<!--end::Icon-->
										</div>
										<!--end::Header-->
										<!--begin::Card body-->
										<div class="card-body d-flex align-items-end mb-3">
											<!--begin::Info-->
											<div class="d-flex align-items-center">
												<asp:Label id="LblTotalDoctors" class="fs-4hx text-white fw-bold me-6" runat="server"/>
												<div class="fw-bold fs-6 text-white">
													<span class="d-block">Total</span>
													<span class="">Doctors</span>
												</div>
											</div>
											<!--end::Info-->
										</div>
										<!--end::Card body-->
									</div>
									<!--end::Card widget 3-->
								</div>
							</div>
							<!--end::Row-->


						</div>
						<!--end::Post-->
					</div>
					<!--end::Container-->

</asp:Content>
