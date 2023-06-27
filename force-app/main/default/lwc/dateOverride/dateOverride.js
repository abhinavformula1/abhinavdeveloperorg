import omniscriptDate from 'vlocity_cmt/omniscriptDate';
export default class DateOverride extends omniscriptDate {
    connectedCallback() {
        super.connectedCallback();
        console.log('Inside Connected Callbacl');
        console.log('jsopnData', JSON.stringify(this.jsonData));
        let minDate = this.jsonData.AccountDetails.EstablishmentDate;
        console.log('minDate', minDate);
        this._min = minDate;
    } renderedCallback() {
        console.log('Inside rendered callback')
    }  
}