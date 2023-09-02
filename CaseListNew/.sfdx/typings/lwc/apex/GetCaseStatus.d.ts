declare module "@salesforce/apex/GetCaseStatus.getCasesByStatus" {
  export default function getCasesByStatus(param: {accountId: any}): Promise<any>;
}
declare module "@salesforce/apex/GetCaseStatus.updateCaseStatus" {
  export default function updateCaseStatus(param: {caseId: any, newStatus: any}): Promise<any>;
}
