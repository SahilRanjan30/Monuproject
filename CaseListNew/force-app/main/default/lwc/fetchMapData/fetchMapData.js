import { LightningElement,wire } from 'lwc';
import mapFun from '@salesforce/apex/MapApex.mapFun';
import { CurrentPageReference } from 'lightning/navigation';


export default class FetchMapData extends LightningElement {
    //@wire(mapFun) mp;
    connectedCallback(){
        mapFun()
        .then(result => {
            console.log('Printing Map values: '+ JSON.stringify(result));   
        })
        .catch(error => {
            this.error = error;
            console.log(this.error);  
        });
        this.getUrl();
        this.testSpread();
   } 

   @wire(CurrentPageReference)
    getPageReferenceParameters(currentPageReference) {
       if (currentPageReference) {
          console.log(currentPageReference);
       }
    }
   
   getUrl(){
        let baseUrl = "https://developer.mozilla.org";
        let A = new URL("/XYZ", baseUrl);
        //console.log(baseUrl);
        console.log(A);
        //let B = new URL();
   }



   //Working of spread-operator.
   testSpread(){
        let firstArray = ['1','2','Leader','King'];
        let secondArray = ['3','4','78','2000'];
        let thirdArray = ['100','200'];

        let newArray = ['Sahil','Ranjan'];
        //let i=0;
       /* newArray.forEach(element => {
            console.log(element);
            //i++;
        });

        */
        let ans = [...firstArray,...secondArray,...thirdArray];
        //For iteration over array elements.
        ans.forEach(element => {
            console.log(element);
        });
        
        console.log(ans);
        

       /* let arr = [];
        for (let index = 1; index <= 10; index++) {
            arr.push(index);
        }
        console.log(arr);
        console.log(ans);

        */

        var k = 10;
        console.log(k);
        {
            var k = 50;
            console.log(k);
        }
        console.log(k);
   }
}