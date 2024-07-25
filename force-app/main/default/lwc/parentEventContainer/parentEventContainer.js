import { LightningElement } from 'lwc';

export default class ParentEventContainer extends LightningElement {
    itemList = [];

    handleMessage(event) {
        this.itemList = [...this.itemList, event.detail.value];
    }
}