export class VoterModel {
  public constructor(
    public voterId?: string,
    public fullName?: string,
    public gender?: string,
    public cellPhone?: string,
    public email?: string,
    public idProdDate?: Date,
    public city?: string,
    public jwtToken?: string,
  ) { }
}
