declare module "@salesforce/apex/searchFunctionality.getContactList" {
  export default function getContactList(param: {searchKey: any}): Promise<any>;
}
declare module "@salesforce/apex/searchFunctionality.searchContact" {
  export default function searchContact(param: {searchKey: any}): Promise<any>;
}
declare module "@salesforce/apex/searchFunctionality.createContact" {
  export default function createContact(param: {Fname: any, Lname: any, Email: any, Phone: any, AccountId: any}): Promise<any>;
}
declare module "@salesforce/apex/searchFunctionality.getAccountContact" {
  export default function getAccountContact(): Promise<any>;
}
