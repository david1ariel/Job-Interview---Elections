export class PartyModel {
  public constructor (
    public partyId?: number,
        public  name?: string,
        public  description?: string,
        public  imageFileName?: string,
        public image?: File,
  ){}
}
