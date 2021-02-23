import { Component, OnInit } from '@angular/core';
import { Unsubscribe } from 'redux';
import { PartyModel } from 'src/app/models/party-model';
import { ReportModel } from 'src/app/models/report-model';
import { VoteModel } from 'src/app/models/vote-model';
import { VoterModel } from 'src/app/models/voter-model';
import { store } from 'src/app/redux/store';
import { ElectionsService } from 'src/app/services/elections.service';

@Component({
  selector: 'app-system-report',
  templateUrl: './system-report.component.html',
  styleUrls: ['./system-report.component.css']
})
export class SystemReportComponent implements OnInit {

  citiesFilter: string[] = [];
  partiesFilter: string[] = [];
  selectedFilter: string;
  reportModels: ReportModel[] = [];
  reportModelsToShow: ReportModel[] = [];

  unsubscribe: Unsubscribe;
  searchIdStr: string;

  constructor(private ElectionsService: ElectionsService) { }

  async ngOnInit() {
    this.unsubscribe = store.subscribe(() => {
      this.reportModels = store.getState().reportModels;
    });
    if (store.getState().reportModels.length === 0)
      await this.ElectionsService.getAllReportModels();
    console.log(this.reportModels);
    this.initCitiesFilter();
    this.initPartiesFilter();
    this.reportModelsToShow = this.reportModels;
  }

  initCitiesFilter() {
    const citiesNotFiltered: string[] = [];
    for (let r of this.reportModels)
      citiesNotFiltered.push(r.city);
    this.citiesFilter = citiesNotFiltered.filter(this.onlyUnique);
  }

  initPartiesFilter() {
    const partiesNotFiltered: string[] = [];
    for (let r of this.reportModels)
      partiesNotFiltered.push(r.party);
    this.partiesFilter = partiesNotFiltered.filter(this.onlyUnique);
  }

  public onlyUnique(value, index, self) {
    return self.indexOf(value) === index;
  }

  filterBySeclection(event) {
    this.selectedFilter = event.target.value;
  }

  filterByCity(event) {
    this.reportModelsToShow = this.reportModels.filter(p => p.city === event.target.value);
  }

  filterByParty(event) {
    this.reportModelsToShow = this.reportModels.filter(p => p.party === event.target.value);
  }

  searchById() {
    this.reportModelsToShow = [];
    if (this.searchIdStr === '')
      this.reportModelsToShow = this.reportModels;
    if (this.searchIdStr !== '') {
      for (let item of this.reportModels) {
        if (item.voterId.includes(this.searchIdStr.toLocaleLowerCase())) {
          this.reportModelsToShow.push(item);
        }
      }
    }
  }
}
