USE govodex;

CREATE SEQUENCE public."FDPStaging_SummaryId_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

ALTER TABLE public."FDPStaging_SummaryId_seq" OWNER TO appuser;
  
CREATE TABLE public."FPDStaging_Summary"
(
  "id" integer NOT NULL DEFAULT nextval('"FDPStaging_SummaryId_seq"'::regclass),
  "reportDate" timestamp with time zone NOT NULL DEFAULT now(),
  "reportName" character varying(200) NOT NULL,
  "loadStatus" character varying(20) NOT NULL DEFAULT 'Started'::character varying,
  "updatedOn" timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT "FPDStaging_Summary_pkey" PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );

ALTER TABLE public."FPDStaging_Summary" OWNER TO appuser;

CREATE TABLE public."FPDStaging_AwardDetails"
(
  "reportDate" timestamp with time zone NOT NULL DEFAULT now(),
  "reportName" character varying(200) NOT NULL,
  "loadStatus" character varying(20) NOT NULL DEFAULT 'Started'::character varying,
  "updatedOn" timestamp with time zone NOT NULL DEFAULT now(),
  "FPDStaging_SummaryId" integer NOT NULL,
  CONSTRAINT FPD_AwardsStaging_Loads_foreign FOREIGN KEY ("FPDStaging_SummaryId")
      REFERENCES public."FPDStaging_Summary" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

ALTER TABLE public."FPDStaging_AwardDetails" OWNER TO appuser;


DROP TABLE public."FPDStaging_AwardDetails";
DROP TABLE public."FPDStaging_Summary";
DROP SEQUENCE public."FDPStaging_SummaryId_seq";


Contracting Agency ID, Contracting Agency Name, Contracting Office ID, Contracting Office Name, Country Where Award was Issued, Funding Agency ID, Funding Agency Name, Funding Department Name, Funding Office ID, Funding Office Name, Is Funded by Foreign Entity (Foreign Funding) Code, Inherently Governmental Description, Inherently Governmental Function, IDV Department ID, IDV Department Name, Referenced IDV Agency ID, (Program Acronym), IDV Program Acronym, PIID, Referenced  IDV PIID, Solicitation ID, Fiscal Year, Date Signed, Effective Date, Completion Date, Est. Ultimate Completion Date, (Last Date To Order), Type of Contract, Type of Set Aside, NAICS Code, NAICS Description, Principal Place of Performance City Name, Principal Place of Performance State Code, Extent Competed, Award or IDV Type, SBIR STTR, Vendor Name, DUNS Number, Zip, (Website URL), Email Address, Number of Offers Received, Modification Number, Reason For Modification Description, Transaction Number, Other Than Full and Open Competition, Performance Based Service Acquisition Code, Solicitation Procedures, Cost or Pricing Data, A-76 Action Code, (Type of IDC), Pre Award FBO Synopsis, Base and All Options Value (Total Contract Value), Action Obligation, Actions

ContractingAgencyID, ContractingAgencyName, ContractingOfficeID, ContractingOfficeName, CountryAwardIssued, FundingAgencyID, FundingAgencyName, FundingDepartmentName, FundingOfficeID, FundingOfficeName, IsFundedForeign, InherentlyGovFunction, InherentlyGovDescription, IDVDepartmentID, IDVDepartmentName, ReferencedIDVAgencyID, ProgramAcronym, IDVProgramAcronym, PIID, ReferencedIDVPIID, SolicitationID, FiscalYear, DateSigned, EffectiveDate, CompletionDate, EstUltimateCompletionDate, LastDateToOrder, TypeofContract, TypeofSetAside, NAICSCode, NAICSDescription, POPCity, POPState, ExtentCompeted, AwardorIDVType, SBIRSTTR, VendorName, DUNSNumber, Zip, WebsiteURL, EmailAddress, NumberofOffersReceived, ModificationNumber, ReasonForMod, TransactionNumber, OTFAC, PBC, SolicitationProcedures, CostPricingData, A76ActionCode, TypeofIDC, PreAwardFBOSynopsis, BaseAndAllOptionsValue, TotalContractValue, ActionObligation, Actions

