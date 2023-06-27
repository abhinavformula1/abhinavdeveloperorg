import omniscriptFile from 'vlocity_cmt/omniscriptFile'
export default class FileOverride extends omniscriptFile {
    renderedCallback() {
        super.renderedCallback()
        console.log('jsopnData',JSON.stringify(this.jsonData));
        this.sizeAlert();

      }
      sizeAlert() {
        console.log(JSON.stringify(this._value))

        let maxSize = this.jsonData['MaxFileSize'];
        let minSize = this.jsonData['MinFileSize'];
    
        let data = this.jsonData['SupportingDocument']?.File1;
        console.log(data, 'data')
        if(data){
            if(data.size > maxSize && data.size < minSize){
                let fileSize = {
                    fileSizeFlag: false
                }
                this.applyCallResp(fileSize)
            }
        }
      }
   
}