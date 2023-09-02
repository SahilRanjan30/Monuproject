import { LightningElement } from 'lwc';
export default class CalloutFromLWC extends LightningElement {
    joke;
    connectedCallback() {
        const endPointURL="https://icanhazdadjoke.com";
        fetch(endPointURL,{
            method: "GET",
            headers: {
                Accept: "application/json"
            }
        })
        .then((response) =>{    
            if(response.ok){
                return response.json();
            }
        })
        .then((responseJSON)=> {
            this.joke=responseJSON.joke;
        });
    }
}