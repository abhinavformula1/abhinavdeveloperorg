// import { LightningElement } from 'lwc';

// export default class Publisher extends LightningElement {

//     value;

//     handleChange(event){
//         this.value = event.target.value;
//     }

//     handleClick(){
//         let event = new CustomEvent('message123',{
//             detail: {
//                 value: this.value
//             }
//         });
//         alert('B4 Event trigger');
//         this.dispatchEvent(event);
//         alert('After Event trigger');
//     }

// }

import { LightningElement } from 'lwc';

export default class Publisher extends LightningElement {
    value;

    handleChange(event) {
        this.value = event.target.value;
    }

    handleClick() {
        let event = new CustomEvent('message', {
            detail: {
                value: this.value
            },
            bubbles: true,
            composed: true
        });
        this.dispatchEvent(event);
    }
}
