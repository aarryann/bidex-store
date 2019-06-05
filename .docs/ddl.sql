create extension if not exists "uuid-ossp";

CREATE TABLE public."Staging_Summary"
(
  "id" uuid DEFAULT uuid_generate_v4 (),
  "reportDate" timestamp with time zone NOT NULL DEFAULT now(),
  "reportName" character varying(200) NOT NULL,
  "loadStatus" character varying(20) NOT NULL DEFAULT 'Started'::character varying,
  "updatedOn" timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT "Staging_Summary_pkey" PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );

ALTER TABLE public."Staging_Summary" OWNER TO appuser;

CREATE TABLE public."FPDStaging_AwardDetails"
(
  "id" uuid DEFAULT uuid_generate_v4(),
  "Staging_SummaryId" uuid NOT NULL,
  "PIID" character varying(50), 
  "ReferencedIDVPIID" character varying(50), 
  "IDVProgramAcronym" character varying(50), 
  "ReqDescription" character varying(4000), 
  "ContractingAgencyID" character varying(50), 
  "ContractingAgencyName" character varying(200), 
  "ContractingOfficeID" character varying(50), 
  "ContractingOfficeName" character varying(200), 
  "CountryAwardIssued" character varying(50), 
  "FundingAgencyID" character varying(50), 
  "FundingAgencyName" character varying(200), 
  "FundingDepartmentName" character varying(200), 
  "FundingOfficeID" character varying(50), 
  "FundingOfficeName" character varying(200), 
  "IsFundedForeign" character varying(50), 
  "InherentlyGovFunction" character varying(50), 
  "InherentlyGovDescription" character varying(50), 
  "IDVDepartmentID" character varying(50), 
  "IDVDepartmentName" character varying(200), 
  "ReferencedIDVAgencyID" character varying(50), 
  "ProgramAcronym" character varying(50), 
  "SolicitationID" character varying(50), 
  "FiscalYear" character varying(50), 
  "DateSigned" character varying(50), 
  "EffectiveDate" character varying(50), 
  "CompletionDate" character varying(50), 
  "EstUltimateCompletionDate" character varying(50), 
  "LastDateToOrder" character varying(50), 
  "TypeofContract" character varying(100), 
  "TypeofSetAside" character varying(100), 
  "NAICSCode" character varying(50), 
  "NAICSDescription" character varying(200), 
  "POPCity" character varying(50), 
  "POPState" character varying(50), 
  "ExtentCompeted" character varying(100), 
  "AwardorIDVType" character varying(50), 
  "SBIRSTTR" character varying(100), 
  "VendorName" character varying(200), 
  "DUNSNumber" character varying(50), 
  "Zip" character varying(50), 
  "WebsiteURL" character varying(200), 
  "EmailAddress" character varying(50), 
  "NumberofOffersReceived" character varying(50), 
  "ModificationNumber" character varying(50), 
  "ReasonForMod" character varying(50), 
  "TransactionNumber" character varying(50), 
  "OTFAC" character varying(50), 
  "PBC" character varying(50), 
  "SolicitationProcedures" character varying(50), 
  "CostPricingData" character varying(50), 
  "A76ActionCode" character varying(50), 
  "TypeofIDC" character varying(50), 
  "PreAwardFBOSynopsis" character varying(50), 
  "BaseAndAllOptionsValue" character varying(50), 
  "TotalContractValue" character varying(50), 
  "ActionObligation" character varying(50), 
  "Actions" character varying(50), 
   
  CONSTRAINT FPD_AwardsStaging_Loads_foreign FOREIGN KEY ("Staging_SummaryId")
      REFERENCES public."Staging_Summary" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

ALTER TABLE public."FPDStaging_AwardDetails" OWNER TO appuser;


DROP TABLE public."FPDStaging_AwardDetails";
DROP TABLE public."Staging_Summary";

SELECT pg_size_pretty( pg_total_relation_size('"Staging_Summary"') );
SELECT pg_size_pretty( pg_total_relation_size('"FPDStaging_AwardDetails"') );