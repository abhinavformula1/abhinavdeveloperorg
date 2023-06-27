import { OmniscriptBaseMixin } from 'vlocity_cmt/omniscriptBaseMixin'
// import { LightningElement } from 'lwc';
// import OmniscriptDate from "vlocity_cmt/omniscriptDate";
export default class Testlwc extends OmniscriptBaseMixin(omniscriptFile) {
        connectedCallback() {
        super.connectedCallback();
        console.log('jsopnData', JSON.stringify(this.jsonData));
        let minDate = this.jsonData['MinDate'];
        console.log('minDate', minDate);
        this._min = minDate;
    } renderedCallback() {
        console.log('inside rendered callback')
    }
}