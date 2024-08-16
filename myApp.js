import { LightningElement, wire, api, track } from 'lwc';
import getLeads from '@salesforce/apex/LeadController.getLeads';
import getCityById from '@salesforce/apex/LeadController.getCityById';
import getWeatherByCity from '@salesforce/apex/WeatherController.getWeatherByCity';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class MyApp extends LightningElement {
    @wire (getLeads)leads;
    @wire (getCityById,{ Id: '$addressId' })cityLead;
    @api addressId;
    city;
    country;
    icon;
    temp_c;
    wind_dir;
    humidity;
    last_updated;
    localtime;
    addListener(event){
        if(event.target.closest(".item")){
          this.addressId = event.currentTarget.value;
        }
      }
    async handleClick(event){
        this.city = this.cityLead.data;
        let response = await this.loadWeatherResponse();
        let data = JSON.parse(response);
        console.log('data:',data);
        if(data.error){
            this.showToast(data.error.message, "City: " + this.city, "error");
            return;
        }
        this.icon = data.current.condition.icon;
        this.country = data.location.country;
        this.temp_c = data.current.temp_c;
        this.wind_dir = data.current.wind_dir;
        this.humidity = data.current.humidity;
        this.localtime = data.location.localtime.substring(data.location.localtime.length-5);
        this.last_updated =  data.current.last_updated.substring(data.current.last_updated.length-5);
    }
    async loadWeatherResponse (){
        let result;
        try {
            result = await getWeatherByCity({city: this.city});
        } catch (error) {
            console.log('error:',error);
            result = undefined;
            this.showToast(error.message, "City: " + this.city, "error");
            return undefined;
        }
        finally{
            return result;
        }
    }
    showToast(title, message, variant){
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}