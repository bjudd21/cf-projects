<%@ Application Language="C#" %>

<script runat="server">

    private void AddPropertyDataRow(System.Data.DataTable dt, string propertyName,string propertyAddress,string propCity, string propState, string propZip, string occupiedUnits, string vacantUnits, string reservedUnits, int pOwnerID, string pOwnerName, string pMap)
    {
        System.Data.DataRow row;
        row = dt.NewRow();

        row["Name"] = propertyName;
        //row["NameLink"] = "PropertyDetails.aspx?pID=" + propID;
        row["propAddress"] = propertyAddress;
        row["propCity"] = propCity;
        row["propState"] = propState;
        row["propZip"] = propZip;
        //row["Occupied"] = occupiedUnits;
        //row["Vacant"] = vacantUnits;
        //row["Reserved"] = reservedUnits;
        //row["pOwnerID"] = pOwnerID;
        //row["pOwnerName"]=pOwnerName;
        row["pMap"] ="javascript:MapIt(" + "'" + pMap + "'" +  ")" ;

        dt.Rows.Add(row);
    }

    private void AddUnitDataRow(System.Data.DataTable dt, int UnitID, int propID, string UnitNumber, string UnitStatus, string LeaseStart, string LeaseEnd, string ReservedDate, string WL, int Bedrooms, string Rent, int UnitTenantID, string PreviousTenant, string UnitAddress, string UnitCity, string UnitState, string UnitZip, string uMap, string uPropName)
    {
        System.Data.DataRow row;
        row = dt.NewRow();
        row["UnitID"] = UnitID;
        row["UnitPropertyID"] = propID;
        row["UnitLink"] = "UnitDetails.aspx?UnitID=" + UnitID;
        row["UnitNumber"] = UnitNumber;
        row["UnitStatus"] = UnitStatus;
        row["LeaseStart"] = LeaseStart;
        row["LeaseEnd"] = LeaseEnd;
        row["ReservedDate"] = ReservedDate;
        row["WL"] = WL;
        row["Bedrooms"] = Bedrooms;
        row["Rent"] = Rent;
        row["UnitTenantID"] = UnitTenantID;
        row["PreviousTenant"] = PreviousTenant;
        row["UnitAddress"] = UnitAddress;
        row["UnitCity"] = UnitCity;
        row["UnitState"] = UnitState;
        row["UnitZip"] = UnitZip;
        row["uMap"] = "javascript:MapIt(" + "'" + uMap + "'" + ")";
        row["uPropName"] = uPropName;
        
        dt.Rows.Add(row);
        
    }

    private void AddUnitDataRow(System.Data.DataTable dt, System.Data.DataRow propParent, string UnitNumber, int Bedrooms, int Rent)
    {
        System.Data.DataRow row;
        row = dt.NewRow();
        row.SetParentRow(propParent);
        
        row["UnitNumber"] = UnitNumber;
        row["Bedrooms"] = Bedrooms;
        row["Rent"] = Rent;
        

        dt.Rows.Add(row);

    }

    private void AddTenantDataRow(System.Data.DataTable dt, int TenantID, int TenantUnitID, int TenantPropertyID, string TenantName, string TenantStatus, string TenantDesiredDate, int TenantOrder, string TenantFromDate, string TenantToDate, string TenantSoc, string TenantOnWait, string TenantPropName, string TenantFamilySize, string TenantJob, string TenantIncome,string TenantEmployer, string TenantAddress)
    {
    System.Data.DataRow row;
        row = dt.NewRow();
        row["TenantID"] = TenantID;
        row["TenantLink"] = "TenantDetails.aspx?TenantID=" + TenantID;
        row["TenantUnitID"] = TenantUnitID;
        row["TenantPropertyID"] = TenantPropertyID;
        row["TenantName"] = TenantName;
        row["TenantStatus"] = TenantStatus;
        row["TenantDesiredDate"] = TenantDesiredDate;
        row["TenantOrder"] = TenantOrder;
        row["TenantFromDate"] = TenantFromDate;
        row["TenantToDate"] = TenantToDate;
        row["TenantSoc"] = TenantSoc;
        row["TenantOnWait"] = TenantOnWait;
        row["TenantPropName"] = TenantPropName;
        row["TenantFamilySize"] = TenantFamilySize;
        row["TenantJob"] = TenantJob;
        row["TenantIncome"] = TenantIncome;
        row["TenantEmployer"] = TenantEmployer;
        row["TenantAddress"] = TenantAddress;
        
        
    dt.Rows.Add(row);
    
    }

    private void AddTenantDataRow(System.Data.DataTable dt, string TenantName, int TenantFamilySize, string TenantJob, int TenantIncome, string TenantEmployer, string TenantAddress)
    {
        System.Data.DataRow row;
        row = dt.NewRow();

        row["TenantName"] = TenantName;
      
        row["TenantFamilySize"] = TenantFamilySize;
        row["TenantJob"] = TenantJob;
        row["TenantIncome"] = TenantIncome;
        row["TenantEmployer"] = TenantEmployer;
        row["TenantAddress"] = TenantAddress;


        dt.Rows.Add(row);

    }


    private void AddReservationsDataRow(System.Data.DataTable dt, int ResTenantID, string ReservationUnit,string ResUnitType, string ResTenantName, string ResTenantStatus, string ResTenantDesiredDate, int ResTenantOrder, string ResTenantFromDate, string ResTenantToDate, string ResUnitAddress)
    {
        System.Data.DataRow row;
        row = dt.NewRow();
        row["ResTenantID"] = ResTenantID;
        row["ReservationUnit"] = ReservationUnit;
        row["ResUnitType"] = ResUnitType;
        row["ResTenantName"] = ResTenantName;
        row["ResTenantStatus"] = ResTenantStatus;
        row["ResTenantDesiredDate"] = ResTenantDesiredDate;
        row["ResTenantOrder"] = ResTenantOrder;
        row["ResTenantFromDate"] = ResTenantFromDate;
        row["ResTenantToDate"] = ResTenantToDate;
        row["ResUnitAddress"] = ResUnitAddress;


        dt.Rows.Add(row);

    }

    private void AddOwnerDataRow(System.Data.DataTable dt, int OwnerID, string OwnerName, string OwnerAddress, string OwnerCity, string OwnerState, string OwnerZip, int OwnerNumberProperties)
    {
        System.Data.DataRow row;
        row = dt.NewRow();
        row["OwnerID"] = OwnerID;
        row["OwnerLink"] = "OwnerDetails.aspx?oID=" + OwnerID;     
        row["OwnerName"] = OwnerName;
        row["OwnerAddress"] = OwnerAddress;
        row["OwnerCity"] = OwnerCity;
        row["OwnerState"] = OwnerState;
        row["OwnerZip"] = OwnerZip;
        row["OwnerNumberProperties"] = OwnerNumberProperties; 
        


        dt.Rows.Add(row);

    }

    private void AddOwnerDataRow(System.Data.DataTable dt, System.Data.DataRow propRow, string OwnerName, string OwnerAddress, string OwnerCity, string OwnerState, string OwnerZip, int OwnerNumberProperties)
    {
        System.Data.DataRow row;
        row = dt.NewRow();
        //row["OwnerID"] = OwnerID;
        //row["OwnerLink"] = "OwnerDetails.aspx?oID=" + OwnerID;
        row["OwnerName"] = OwnerName;
        row["OwnerAddress"] = OwnerAddress;
        row["OwnerCity"] = OwnerCity;
        row["OwnerState"] = OwnerState;
        row["OwnerZip"] = OwnerZip;
        //row["OwnerNumberProperties"] = OwnerNumberProperties;



        dt.Rows.Add(row);
        
        //update property row
        propRow.SetParentRow(row);

    }

    private System.Data.DataTable AddPropertyTable(System.Data.DataSet ds)
    {
        System.Data.DataTable propertyTable = new System.Data.DataTable("Properties");
        //Property Table

        System.Data.DataColumn dcID = new System.Data.DataColumn("ID", typeof(int));
        dcID.AutoIncrement = true;
        propertyTable.Columns.Add(dcID);
        propertyTable.PrimaryKey = new System.Data.DataColumn[] { dcID };

        System.Data.DataColumn dcName = new System.Data.DataColumn("Name", typeof(string));
        propertyTable.Columns.Add(dcName);

        //System.Data.DataColumn dcNameLink = new System.Data.DataColumn("NameLink", typeof(string));
        //propertyTable.Columns.Add(dcNameLink);

        System.Data.DataColumn dcPropAddress = new System.Data.DataColumn("propAddress", typeof(string));
        propertyTable.Columns.Add(dcPropAddress);

        System.Data.DataColumn dcPropCity = new System.Data.DataColumn("propCity", typeof(string));
        propertyTable.Columns.Add(dcPropCity);

        System.Data.DataColumn dcPropState = new System.Data.DataColumn("propState", typeof(string));
        propertyTable.Columns.Add(dcPropState);

        System.Data.DataColumn dcPropZip = new System.Data.DataColumn("propZip", typeof(string));
        propertyTable.Columns.Add(dcPropZip);

        System.Data.DataColumn dcOccupied = new System.Data.DataColumn("Occupied", typeof(int));
        propertyTable.Columns.Add(dcOccupied);

        System.Data.DataColumn dcVacant = new System.Data.DataColumn("Vacant", typeof(int));
        propertyTable.Columns.Add(dcVacant);

        System.Data.DataColumn dcReserved = new System.Data.DataColumn("Reserved", typeof(int));
        propertyTable.Columns.Add(dcReserved);

        System.Data.DataColumn dcpOwnerID = new System.Data.DataColumn("pOwnerID", typeof(int));
        propertyTable.Columns.Add(dcpOwnerID);

        //System.Data.DataColumn dcpOwnerName = new System.Data.DataColumn("pOwnerName", typeof(string));
        //propertyTable.Columns.Add(dcpOwnerName);

        System.Data.DataColumn dcpMap = new System.Data.DataColumn("pMap", typeof(string));
        propertyTable.Columns.Add(dcpMap);

        ds.Tables.Add(propertyTable);
        return propertyTable;
    }

    
    private System.Data.DataTable AddUnitsTable(System.Data.DataSet ds)
    {
        System.Data.DataTable unitTable = new System.Data.DataTable("Units");

        //ADD UNITS TO UNIT TABLE
        System.Data.DataColumn dcUnitID = new System.Data.DataColumn("UnitID", typeof(int));
        dcUnitID.AutoIncrement = true;
        unitTable.Columns.Add(dcUnitID);
        unitTable.PrimaryKey = new System.Data.DataColumn[] { dcUnitID };

        System.Data.DataColumn dcUPropertyID = new System.Data.DataColumn("UnitPropertyID", typeof(int));
        unitTable.Columns.Add(dcUPropertyID);

        System.Data.DataColumn dcUnitNumber = new System.Data.DataColumn("UnitNumber", typeof(string));
        unitTable.Columns.Add(dcUnitNumber);

        System.Data.DataColumn dcUnitLink = new System.Data.DataColumn("UnitLink", typeof(string));
        unitTable.Columns.Add(dcUnitLink);

        System.Data.DataColumn dcUnitStatus = new System.Data.DataColumn("UnitStatus", typeof(string));
        unitTable.Columns.Add(dcUnitStatus);

        System.Data.DataColumn dcLeaseStart = new System.Data.DataColumn("LeaseStart", typeof(string));
        unitTable.Columns.Add(dcLeaseStart);

        System.Data.DataColumn dcLeaseEnd = new System.Data.DataColumn("LeaseEnd", typeof(string));
        unitTable.Columns.Add(dcLeaseEnd);

        System.Data.DataColumn dcReservedDate = new System.Data.DataColumn("ReservedDate", typeof(string));
        unitTable.Columns.Add(dcReservedDate);

        System.Data.DataColumn dcWL = new System.Data.DataColumn("WL", typeof(string));
        unitTable.Columns.Add(dcWL);

        System.Data.DataColumn dcBedrooms = new System.Data.DataColumn("Bedrooms", typeof(int));
        unitTable.Columns.Add(dcBedrooms);

        System.Data.DataColumn dcRent = new System.Data.DataColumn("Rent", typeof(int));
        unitTable.Columns.Add(dcRent);

        System.Data.DataColumn dcUnitTenantID = new System.Data.DataColumn("UnitTenantID", typeof(int));
        unitTable.Columns.Add(dcUnitTenantID);

        System.Data.DataColumn dcUnitPreviousTenant = new System.Data.DataColumn("PreviousTenant", typeof(string));
        unitTable.Columns.Add(dcUnitPreviousTenant);

        System.Data.DataColumn dcUnitAddress = new System.Data.DataColumn("UnitAddress", typeof(string));
        unitTable.Columns.Add(dcUnitAddress);

        System.Data.DataColumn dcUnitCity = new System.Data.DataColumn("UnitCity", typeof(string));
        unitTable.Columns.Add(dcUnitCity);

        System.Data.DataColumn dcUnitState = new System.Data.DataColumn("UnitState", typeof(string));
        unitTable.Columns.Add(dcUnitState);

        System.Data.DataColumn dcUnitZip = new System.Data.DataColumn("UnitZip", typeof(string));
        unitTable.Columns.Add(dcUnitZip);

        System.Data.DataColumn dcuMap = new System.Data.DataColumn("uMap", typeof(string));
        unitTable.Columns.Add(dcuMap);

        System.Data.DataColumn dcuPropName = new System.Data.DataColumn("uPropName", typeof(string));
        unitTable.Columns.Add(dcuPropName);

        ds.Tables.Add(unitTable);
        
        System.Data.DataRelation drPropUnits = new System.Data.DataRelation("PropertyUnits", 
                                                                            ds.Tables["Properties"].Columns["ID"], 
                                                                            ds.Tables["Units"].Columns["UnitPropertyID"],
                                                                            true);

        ds.Relations.Add(drPropUnits); 
        //add relationship to properties
        System.Random rand = new Random(System.DateTime.Now.Millisecond);
        foreach (System.Data.DataRow drProp in ds.Tables["Properties"].Rows)
        {
            //add random 10 - 100 units;
            int unitCount = (rand.Next(9) + 1) * 10;

            int iCur = 0;

            while (iCur < unitCount)
            {
                iCur++;
                System.Data.DataRow unitRow = unitTable.NewRow();
                unitRow.SetParentRow(drProp, drPropUnits);

                string unitNo = string.Empty;
                if (unitCount < 40)
                {
                    //two floors
                    if (iCur <= (unitCount / 2))
                        unitNo = "#" + (100 + iCur).ToString();
                    else
                        unitNo = "#" + (200 + iCur).ToString();
                }
                else if (unitCount >= 40 && unitCount < 70)
                {
                    //letters
                    int addBy = System.Convert.ToInt32((iCur - 1) / 10) + 1;
                    int iLetter = ((iCur - 1) % 10) + 65;
                    string letter = ((char)iLetter).ToString();
                 
                    unitNo = "#" + addBy.ToString() + letter ;
                           
                 

                }
                else
                {
                    //floors
                    int addBy = (System.Convert.ToInt32((iCur - 1) / 10) + 1) * 100;
                    unitNo = "#" + (addBy + ((iCur - 1) % 10)).ToString();
                }

                int beds = rand.Next(4) + 1;

                int rent = (rand.Next(10) + 1) * 150;

                this.AddUnitDataRow(unitTable, drProp, unitNo, beds, rent);
                
            }
            
            
            
        }

        return unitTable;
    }


    private void AddUnits(BusinessObjectContainer boc)
    {
        
        //add relationship to properties
        System.Random rand = new Random(System.DateTime.Now.Millisecond);
        foreach (BusinessObjectContainer.Property drProp in boc.Properties)
        {
            //add random 10 - 100 units;
            int unitCount = (rand.Next(9) + 1) * 10;

            int iCur = 0;

            while (iCur < unitCount)
            {
                iCur++;
                //BusinessObjectContainer.Unit unitRow = unitTable.NewRow();
                //unitRow.SetParentRow(drProp, drPropUnits);

                string unitNo = string.Empty;
                if (unitCount < 40)
                {
                    //two floors
                    if (iCur <= (unitCount / 2))
                        unitNo = "#" + (100 + iCur).ToString();
                    else
                        unitNo = "#" + (200 + iCur).ToString();
                }
                else if (unitCount >= 40 && unitCount < 70)
                {
                    //letters
                    int addBy = System.Convert.ToInt32((iCur - 1) / 10) + 1;
                    int iLetter = ((iCur - 1) % 10) + 65;
                    string letter = ((char)iLetter).ToString();

                    unitNo = "#" + addBy.ToString() + letter;



                }
                else
                {
                    //floors
                    int addBy = (System.Convert.ToInt32((iCur - 1) / 10) + 1) * 100;
                    unitNo = "#" + (addBy + ((iCur - 1) % 10)).ToString();
                }

                int beds = rand.Next(4) + 1;

                int rent = (rand.Next(10) + 1) * 150;

                boc.AddUnit(drProp, unitNo, rent, beds, 1);
                
                //this.AddUnitDataRow(unitTable, drProp, unitNo, beds, rent);

            }
        }
    }

    private void AddTenants(BusinessObjectContainer boc)
    {

        //create twice the number of tenants as the number of units
        System.Random r = new Random(System.DateTime.Now.Millisecond);
        for (int i = 0; i < boc.Units.Count * 4; i++)
        {
            int dupe = 0;
            string tenName = this.GetRandomName();
            //System.Data.DataView dv = TenantTable.DefaultView;
            //dv.RowFilter = "TenantName = '" + tenName + "'";
            while (boc.FindTenants(tenName).Count > 0)
            {
                dupe++;

                if (dupe > 50)
                {
                    throw new Exception("Might need to add more names to array");
                }

                tenName = this.GetRandomName();
                //dv.RowFilter = "TenantName = '" + tenName + "'";
                //System.Diagnostics.Debug.WriteLine(dv.RowFilter);
            }
            int famSize = r.Next(6);
            int income = r.Next(25000, 150000);
            string job = this.jobs[r.Next(0, this.jobs.Length - 1)];
            string employer = this.employers[r.Next(this.employers.Length - 1)];
            boc.AddTenant(tenName, famSize, job, income, employer);

        }
    }
    
    private System.Data.DataTable AddTenantsTable(System.Data.DataSet ds)
    {
        System.Data.DataTable TenantTable = new System.Data.DataTable("Tenants");
        
        
        //ADD Tenants

        System.Data.DataColumn dcTenantID = new System.Data.DataColumn("TenantID", typeof(int));
        dcTenantID.AutoIncrement = true;
        TenantTable.Columns.Add(dcTenantID);
        TenantTable.PrimaryKey = new System.Data.DataColumn[] { dcTenantID };

        //System.Data.DataColumn dcTenantUnitID = new System.Data.DataColumn("TenantUnitID", typeof(int));
        //TenantTable.Columns.Add(dcTenantUnitID);

        //System.Data.DataColumn dcTenantPropertyID = new System.Data.DataColumn("TenantPropertyID", typeof(int));
        //TenantTable.Columns.Add(dcTenantPropertyID);


        System.Data.DataColumn dcTenantName = new System.Data.DataColumn("TenantName", typeof(string));
        TenantTable.Columns.Add(dcTenantName);

        //System.Data.DataColumn dcTenantLink = new System.Data.DataColumn("TenantLink", typeof(string));
        //TenantTable.Columns.Add(dcTenantLink);

        //System.Data.DataColumn dcTenantStatus = new System.Data.DataColumn("TenantStatus", typeof(string));
        //TenantTable.Columns.Add(dcTenantStatus);

        //System.Data.DataColumn dcTenantDesiredDate = new System.Data.DataColumn("TenantDesiredDate", typeof(string));
        //TenantTable.Columns.Add(dcTenantDesiredDate);

        //System.Data.DataColumn dcTenantOrder = new System.Data.DataColumn("TenantOrder", typeof(int));
        //TenantTable.Columns.Add(dcTenantOrder);

        //System.Data.DataColumn dcTenantFromDate = new System.Data.DataColumn("TenantFromDate", typeof(string));
        //TenantTable.Columns.Add(dcTenantFromDate);

        //System.Data.DataColumn dcTenantToDate = new System.Data.DataColumn("TenantToDate", typeof(string));
        //TenantTable.Columns.Add(dcTenantToDate);

        //System.Data.DataColumn dcTenantSoc = new System.Data.DataColumn("TenantSoc", typeof(string));
        //TenantTable.Columns.Add(dcTenantSoc);

        //System.Data.DataColumn dcTenantOnWait = new System.Data.DataColumn("TenantOnWait", typeof(string));
        //TenantTable.Columns.Add(dcTenantOnWait);

        //System.Data.DataColumn dcTenantPropName = new System.Data.DataColumn("TenantPropName", typeof(string));
        //TenantTable.Columns.Add(dcTenantPropName);

        System.Data.DataColumn dcTenantFamilySize = new System.Data.DataColumn("TenantFamilySize", typeof(int));
        TenantTable.Columns.Add(dcTenantFamilySize);

        System.Data.DataColumn dcTenantJob = new System.Data.DataColumn("TenantJob", typeof(string));
        TenantTable.Columns.Add(dcTenantJob);

        System.Data.DataColumn dcTenantIncome = new System.Data.DataColumn("TenantIncome", typeof(int));
        TenantTable.Columns.Add(dcTenantIncome);

        System.Data.DataColumn dcTenantEmployer = new System.Data.DataColumn("TenantEmployer", typeof(string));
        TenantTable.Columns.Add(dcTenantEmployer);

        System.Data.DataColumn dcTenantAddress = new System.Data.DataColumn("TenantAddress", typeof(string));
        TenantTable.Columns.Add(dcTenantAddress);


        //create twice the number of tenants as the number of units
        System.Random r = new Random(System.DateTime.Now.Millisecond);
        for (int i = 0; i < ds.Tables["Units"].Rows.Count * 4; i++)
        {
            int dupe = 0;
            string tenName = this.GetRandomName();
            System.Data.DataView dv = TenantTable.DefaultView;
            dv.RowFilter = "TenantName = '" + tenName + "'";
            while (dv.Count > 0)
            {
                dupe++;

                if (dupe > 50)
                {
                    throw new Exception("Might need to add more names to array");
                }

                tenName = this.GetRandomName();
                dv.RowFilter = "TenantName = '" + tenName + "'";
                //System.Diagnostics.Debug.WriteLine(dv.RowFilter);
            }
            int famSize = r.Next(4);
            int income = r.Next(25000, 150000);
            string job = this.jobs[r.Next(0, this.jobs.Length - 1)];
            string employer = this.employers[r.Next(this.employers.Length - 1)];
            this.AddTenantDataRow(TenantTable, tenName, famSize, job, income, employer, "");
            
        }
        //this.AddTenantDataRow(TenantTable, 1, 1, 1, "John Jones", "Active", "NA", 1, "10/3/2008", "10/3/2009", "5555", "No", "Abc Condos", "3", "Welder", "25,000", "Metal Inc.", "N 59th St. Tampa FL 33617");
        //this.AddTenantDataRow(TenantTable, 2, 2, 1, "Larry Smith", "Active", "NA", 1, "7/20/2007", "7/20/2009", "4444", "Yes", "Happy Homes", "1", "Programmer", "35,000", "Computers Inc.", "7801 Andalusia Pl. Tampa FL 33614");
        //this.AddTenantDataRow(TenantTable, 3, 0, 0, "Tom Arya", "Active", "12/3/2010", 2, "5/15/2005", "5/15/2009", "1111", "No", "Heritage Houses", "6", "Electrician", "30,000", "Electricity Inc.", "5320 E 14th Ave. Tampa FL  33619");
        //this.AddTenantDataRow(TenantTable, 4, 0, 0, "Kirk Hammet", "Active", "8/20/2010", 1, "3/30/2003", "3/30/2006", "9999", "Yes", "State Living", "2", "Musician", "15,000", "Music Inc.", "8801 Leeward Dr. Tampa FL 33634");
        ds.Tables.Add(TenantTable);
        return TenantTable;
    }

    private System.Data.DataTable AddOwnerTable(System.Data.DataSet ds)
    {
        //Owners       
        System.Data.DataTable OwnerTable = new System.Data.DataTable("Owner");
        
        System.Data.DataColumn dcOwnerID = new System.Data.DataColumn("OwnerID", typeof(int));
        dcOwnerID.AutoIncrement = true;
        OwnerTable.Columns.Add(dcOwnerID);
        OwnerTable.PrimaryKey = new System.Data.DataColumn[] { dcOwnerID };

        System.Data.DataColumn dcOwnerLink = new System.Data.DataColumn("OwnerLink", typeof(string));
        OwnerTable.Columns.Add(dcOwnerLink);

        System.Data.DataColumn dcOwnerName = new System.Data.DataColumn("OwnerName", typeof(string));
        OwnerTable.Columns.Add(dcOwnerName);

        System.Data.DataColumn dcOwnerAddress = new System.Data.DataColumn("OwnerAddress", typeof(string));
        OwnerTable.Columns.Add(dcOwnerAddress);

        System.Data.DataColumn dcOwnerCity = new System.Data.DataColumn("OwnerCity", typeof(string));
        OwnerTable.Columns.Add(dcOwnerCity);

        System.Data.DataColumn dcOwnerState = new System.Data.DataColumn("OwnerState", typeof(string));
        OwnerTable.Columns.Add(dcOwnerState);

        System.Data.DataColumn dcOwnerZip = new System.Data.DataColumn("OwnerZip", typeof(string));
        OwnerTable.Columns.Add(dcOwnerZip);

        System.Data.DataColumn dcOwnerNumberProperties = new System.Data.DataColumn("OwnerNumberProperties", typeof(int));
        OwnerTable.Columns.Add(dcOwnerNumberProperties);

        ds.Tables.Add(OwnerTable);

        System.Data.DataRelation drPropOwner = new System.Data.DataRelation("OwnerProperty",
                                                                            ds.Tables["Owner"].Columns["OwnerID"],
                                                                            ds.Tables["Properties"].Columns["pOwnerID"],
                                                                            true);
        
        //add 1 owner for each property
        foreach (System.Data.DataRow drProp in ds.Tables["Properties"].Rows)
        {
            string ownerName = this.GetRandomName();
            this.AddOwnerDataRow(OwnerTable, drProp, ownerName, string.Empty, string.Empty, string.Empty, string.Empty, 0);
            
        }
        //this.AddOwnerDataRow(OwnerTable, 1, "Abc Condos", "2222, Good St.", "Tampa", "FL", "33617", 3);
        //this.AddOwnerDataRow(OwnerTable, 2, "Fun Properties", "4444, Hello St.", "Tampa", "FL", "33616", 1);
        //this.AddOwnerDataRow(OwnerTable, 3, "ABC Rentals", "3232, Green St.", "Tampa", "FL", "33617", 2);
        //this.AddOwnerDataRow(OwnerTable, 4, "Fred Owner", "5544, Orange St.", "Tampa", "FL", "33617", 5);
        //this.AddOwnerDataRow(OwnerTable, 5, "Ocean Rentals", "3354, Purple St.", "Tampa", "FL", "33619", 1);
        //this.AddOwnerDataRow(OwnerTable, 6, "Sally Owner", "8388, Water St.", "Tampa", "FL", "33619", 1);


        return OwnerTable;
        
    }


    private void AddOwners(BusinessObjectContainer boc)
    {
        
        //add 1 owner for each property
        foreach (BusinessObjectContainer.Property drProp in boc.Properties)
        {
            string ownerName = this.GetRandomName();
            boc.AddOwner(drProp, ownerName);

        }
    

    }
    
    private System.Data.DataTable AddContractsTable(System.Data.DataSet ds)
    {
        System.Data.DataTable dt = new System.Data.DataTable("Contracts");

        System.Data.DataColumn dcContractID = new System.Data.DataColumn("ContractID", typeof(int));
        dcContractID.AutoIncrement = true;
        dt.Columns.Add(dcContractID);
        dt.PrimaryKey = new System.Data.DataColumn[] { dcContractID };

        System.Data.DataColumn dcProp = new System.Data.DataColumn("PropertyID", typeof(int));
        dt.Columns.Add(dcProp);
        
        System.Data.DataColumn dcUnit = new System.Data.DataColumn("UnitID", typeof(int));
        dt.Columns.Add(dcUnit);

        System.Data.DataColumn dcTenant = new System.Data.DataColumn("TenantID", typeof(int));
        dt.Columns.Add(dcTenant);
        
        System.Data.DataColumn dcContractStart = new System.Data.DataColumn("ContractStart", typeof(DateTime));
        dt.Columns.Add(dcContractStart);

        System.Data.DataColumn dcContractEnd = new System.Data.DataColumn("ContractEnd", typeof(DateTime));
        dt.Columns.Add(dcContractEnd);

        System.Data.DataColumn dcContractRent = new System.Data.DataColumn("ContractRent", typeof(decimal));
        dt.Columns.Add(dcContractRent);
        
        ds.Tables.Add(dt);

        System.Data.DataRelation drPropertyContracts = new System.Data.DataRelation("PropertyContracts",
                                                                                ds.Tables["Properties"].Columns["ID"],
                                                                                ds.Tables["Contracts"].Columns["PropertyID"],
                                                                                true);
        
        System.Data.DataRelation drUnitContracts = new System.Data.DataRelation("UnitContracts",
                                                                                ds.Tables["Units"].Columns["UnitID"],
                                                                                ds.Tables["Contracts"].Columns["UnitID"],
                                                                                true);

        System.Data.DataRelation drTenantContracts = new System.Data.DataRelation("TenantContracts",
                                                                                ds.Tables["Tenants"].Columns["TenantID"],
                                                                                ds.Tables["Contracts"].Columns["TenantID"],
                                                                                true);


        System.Random r = new Random(System.DateTime.Now.Millisecond);
        foreach (System.Data.DataRow drUnit in ds.Tables["Units"].Rows)
        {

            bool makeReservation = false;
            
            //25% chance of making a reservation
            if (r.Next(1, 4) == 1)
                makeReservation = true;
                
                
            //create lease history
            DateTime dCurrent = new DateTime(2005, 1, 1);
            //get vacancy from start
            while (dCurrent < System.DateTime.Now || makeReservation == true)
            {
                dCurrent = dCurrent.AddMonths(r.Next(6));
                if (dCurrent > System.DateTime.Now && makeReservation == false)
                {
                    //unit is currently vacant.
                    break;
                }
                if (dCurrent > System.DateTime.Now)
                    makeReservation = false;
                    
                //get the lease length
                int leaseMonths = r.Next(1, 6) * 3;
                int tenantID = (int)ds.Tables["Tenants"].Rows[r.Next(ds.Tables["Tenants"].Rows.Count - 1)]["TenantID"];

                System.Data.DataView dv = dt.DefaultView;
                dv.RowFilter = "TenantID = " + tenantID + " AND ((ContractStart <= '" + dCurrent.ToString("MM/dd/yyyy") + "' AND ContractEnd >= '" + dCurrent.AddMonths(leaseMonths).AddDays(-1).ToString("MM/dd/yyyy") + "')" +
                                                            " OR (ContractStart >= '" + dCurrent.ToString("MM/dd/yyyy") + "' AND ContractEnd <= '" + dCurrent.AddMonths(leaseMonths).AddDays(-1).ToString("MM/dd/yyyy") + "')" +
                                                            " OR (ContractStart <= '" + dCurrent.ToString("MM/dd/yyyy") + "' AND ContractEnd >= '" + dCurrent.ToString("MM/dd/yyyy") + "')" +
                                                            " OR (ContractStart <= '" + dCurrent.AddMonths(leaseMonths).AddDays(-1).ToString("MM/dd/yyyy") + "' AND ContractEnd >= '" + dCurrent.AddMonths(leaseMonths).AddDays(-1).ToString("MM/dd/yyyy") + "'))";
                int dupeCount = 0;
                while (dv.Count > 0)
                {
                    dupeCount++;
                    if (dupeCount > 50)
                    {
                        throw new Exception("Need more tenants");    
                    }
                    
                    tenantID = (int)ds.Tables["Tenants"].Rows[r.Next(ds.Tables["Tenants"].Rows.Count - 1)]["TenantID"];
                    dv.RowFilter = "TenantID = " + tenantID + " AND ContractEnd > '" + dCurrent.ToString("MM/dd/yyyy") + "'";

                }
                
                //add contract
                System.Data.DataRow drContract = dt.NewRow();

                drContract["ContractStart"] = dCurrent;
                drContract["ContractEnd"] = dCurrent.AddMonths(leaseMonths).AddMinutes(-1);
                drContract["PropertyID"] = drUnit["UnitPropertyID"];
                drContract["UnitID"] = drUnit["UnitID"];
                drContract["TenantID"] = tenantID;
                drContract["ContractRent"] = System.Convert.ToDouble(drUnit["Rent"]) - (System.Math.Round(System.Convert.ToDouble(drUnit["Rent"]) * ((TimeSpan)(DateTime.Now - dCurrent)).TotalDays * 0.0001096, 2));
                dt.Rows.Add(drContract);
                dCurrent = dCurrent.AddMonths(leaseMonths);
            }
            
            
            
        }


        return dt;
    }

    private void AddContracts(BusinessObjectContainer boc)
    {
        

        System.Random r = new Random(System.DateTime.Now.Millisecond);
        foreach (BusinessObjectContainer.Unit unit in boc.Units)
        {

            bool makeReservation = false;

            //25% chance of making a reservation
            if (r.Next(1, 4) == 1)
                makeReservation = true;


            //create lease history
            DateTime dCurrent = new DateTime(2005, 1, 1);
            //get vacancy from start
            while (dCurrent < System.DateTime.Now || makeReservation == true)
            {
                dCurrent = dCurrent.AddMonths(r.Next(6));
                if (dCurrent > System.DateTime.Now && makeReservation == false)
                {
                    //unit is currently vacant.
                    break;
                }
                if (dCurrent > System.DateTime.Now)
                    makeReservation = false;

                //get the lease length
                int leaseMonths = r.Next(1, 6) * 3;
                BusinessObjectContainer.Tenant tenant = boc.Tenants[r.Next(boc.Tenants.Count - 1)];

                int dupeCount = 0;
                while (boc.FindContractCollisions(tenant, dCurrent,  dCurrent.AddMonths(leaseMonths).AddDays(-1)).Count > 0)
                {
                    dupeCount++;
                    if (dupeCount > 50)
                    {
                        throw new Exception("Need more tenants");
                    }

                    tenant = boc.Tenants[r.Next(boc.Tenants.Count - 1)];
                    //dv.RowFilter = "TenantID = " + tenantID + " AND ContractEnd > '" + dCurrent.ToString("MM/dd/yyyy") + "'";

                }

                //add contract
                
                double rent = System.Convert.ToDouble(unit.Rent) - (System.Math.Round(System.Convert.ToDouble(unit.Rent) * ((TimeSpan)(DateTime.Now - dCurrent)).TotalDays * 0.0001096, 2));
                boc.AddContract(unit, tenant, dCurrent, dCurrent.AddMonths(leaseMonths).AddMinutes(-1), rent);
                
                dCurrent = dCurrent.AddMonths(leaseMonths);
                
                
            }



        }

    }
    
    private string[] propertyNames = new string[] { "Oakwood", "Embassy", "Riverview", "Fairlawn", "Iceberg", "Crimson", "Boardwalk", "Glacial", "Sleepy Hollow", "Duke" };
    private string[] propertySuffixes = new string[] { "Suites", "Estates", "Mannor", "Condos", "Villiage", "Place", "Avenue" };
    private string[] firstNames = new string[] { "John", "James", "Robert", "Michael", "William", "David", "Richard", "Charles", "Joseph", "Thomas", "Christopher", "Daniel", "Paul", "Mark", "Donald", "George", "Kenneth", "Steven", "Edward", "Brian", "Ronald", "Anthony", "Kevin", "Jason", "Matthew", "Gary", "Timothy", "Jose", "Lary", "Jeffery", "Frank", "Mary", "Patricia", "Linda", "Barbara", "Elizabeth", "Jennifer", "Maria", "Susan", "Margaret", "Dorothy", "Lisa", "Nancy", "Karen", "Betty", "Helen", "Sandra", "Donna", "Carol", "Ruth", "Sharon", "Michelle", "Laura", "Sarah", "Kimberly", "Deborah", "Jessica", "Shirley", "Cythia", "Angela", "Melissa" };
    private string[] lastNames = new string[] { "Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez", "King", "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson", "Carter", "Mitchel", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards", "Collins", "Stewart", "Sanchez", "Morris", "Rogers", "Reed", "Cook", "Morgan", "Bell", "Murphy", "Bailey" };
    private string[] employers = new string[] { "RDL Transportation", "FST Technologies", "BRS Management", "QST Logistics", "MEP Recruiters" };
    private string[] jobs = new string[] { "Driver", "General Laborer", "Engineer", "Entertainer", "Executive", "Manager", "Team Leader", "Architect" };
    private System.Random NameRandom = new Random(DateTime.Now.Millisecond);
    private string GetRandomName()
    {
        System.Random r = NameRandom;
        int firstName = r.Next(this.firstNames.Length);
        int lastName = r.Next(this.lastNames.Length);
        return this.firstNames[firstName] + " " + this.lastNames[lastName];
    }
    private string GetPropertyName(BusinessObjectContainer boc)
    {
        string prefix = this.propertyNames[this.NameRandom.Next(propertyNames.Length)];
        while (boc.Properties.Find(x => x.Name.StartsWith(prefix)) != null)
        {
            prefix = this.propertyNames[this.NameRandom.Next(propertyNames.Length)];
        }
        return prefix + " " +
               this.propertySuffixes[this.NameRandom.Next(propertySuffixes.Length)];
    }
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        //System.Data.DataSet ds = new System.Data.DataSet();

        BusinessObjectContainer boc = new BusinessObjectContainer();
        boc.AddProperty(this.GetPropertyName(boc), "N 59th St.", "Tampa", "FL", "33617");
        boc.AddProperty(this.GetPropertyName(boc), "4214 E Palifox St.", "Tampa", "FL", "33610");
        boc.AddProperty(this.GetPropertyName(boc), "7801 Andalusia Pl.", "Tampa", "FL", "33614");
        boc.AddProperty(this.GetPropertyName(boc), "5320 E 14th Ave.", "Tampa", "FL", "33619");
        boc.AddProperty(this.GetPropertyName(boc), "2910 Cord St.", "Tampa", "FL", "33605");
        boc.AddProperty(this.GetPropertyName(boc), "8801 Leeward Dr.", "Tampa", "FL", "33634");
        boc.AddProperty(this.GetPropertyName(boc), "8909 Peppermill Ct.", "Tampa", "FL", "33634");
        boc.AddProperty(this.GetPropertyName(boc), "3218 Deerfield Dr", "Tampa", "FL", "33619");

        this.AddOwners(boc);
        this.AddUnits(boc);
        this.AddTenants(boc);
        this.AddContracts(boc);

        this.Application.Add("boc", boc);
        //properties
        //System.Data.DataTable propertyTable = this.AddPropertyTable(ds);
        //this.AddPropertyDataRow(propertyTable, this.GetPropertyName(), "N 59th St.", "Tampa", "FL", "33617", "34", "5", "3", 1, "Abc Condos", "N 59th St. Tampa FL 33617");
        //this.AddPropertyDataRow(propertyTable, this.GetPropertyName(), "4214 E Palifox St.", "Tampa", "FL", "33610", "34", "5", "3", 2, "Fun Properties", "4214 E Palifox St. Tampa FL 33610");
        //this.AddPropertyDataRow(propertyTable, this.GetPropertyName(), "7801 Andalusia Pl.", "Tampa", "FL", "33614", "34", "5", "3", 3, "ABC Rentals", "7801 Andalusia Pl. Tampa FL 33614");
        //this.AddPropertyDataRow(propertyTable, this.GetPropertyName(), "5320 E 14th Ave.", "Tampa", "FL", "33619", "34", "5", "3", 4, "Fred Owner", "5320 E 14th Ave. Tampa FL  33619");
        //this.AddPropertyDataRow(propertyTable, this.GetPropertyName(), "2910 Cord St.", "Tampa", "FL", "33605", "34", "5", "3", 1, "Ocean Rentals", "2910 Cord St. Tampa FL 33605");
        //this.AddPropertyDataRow(propertyTable, this.GetPropertyName(), "8801 Leeward Dr.", "Tampa", "FL", "33634", "34", "5", "3", 5, "Sally Owner", "8801 Leeward Dr. Tampa FL 33634");
        //this.AddPropertyDataRow(propertyTable, this.GetPropertyName(), "8909 Peppermill Ct.", "Tampa", "FL", "33634", "34", "5", "3", 6, "Sally Owner", "8909 Peppermill Ct. Tampa FL 33634");
        //this.AddPropertyDataRow(propertyTable, this.GetPropertyName(), "3218 Deerfield Dr", "Tampa", "FL", "33619", "34", "5", "3", 4, "Ocean Rentals", "3218 Deerfield Dr Tampa FL 33619");

        //units
        //System.Data.DataTable unitTable = this.AddUnitsTable(ds);
        //this.AddUnitDataRow(unitTable, 1, 1, "A44", "vacant", "8/7/2010", "8/7/2011", "4/3/2009", "Yes", 2, "$800.00", 1, "Larry Johnson", "N 59th St.", "Tampa", "FL", "33617", "N 59th St. Tampa FL  33617", "Abc Condos");
        //this.AddUnitDataRow(unitTable, 2, 1, "A55", "occupied", "8/4/2010", "8/4/2011", "6/5/2009", "Yes", 1, "$700.00", 2, "Fred Flintstone", "4214 E Palifox St.", "Tampa", "FL", "33610", "4214 E Palifox St. Tampa FL 33610", "Happy Homes");
        //this.AddUnitDataRow(unitTable, 3, 2, "B65", "vacant", "4/5/2010", "4/5/2011", "9/7/2009", "Yes", 3, "$900.00", 3, "Barney Rubble", "7801 Andalusia Pl.", "Tampa", "FL", "33614", "7801 Andalusia Pl. Tampa FL 33614", "Heritage Houses");
        //this.AddUnitDataRow(unitTable, 4, 2, "D76", "vacant", "4/7/2010", "4/7/2011", "9/1/2009", "Yes", 2, "$800.00", 4, "Bruce Lee", "5320 E 14th Ave.", "Tampa", "FL", "33619", "5320 E 14th Ave. Tampa FL 33619", "State Living");
        //this.AddUnitDataRow(unitTable, 5, 2, "D96", "vacant", "2/7/2010", "2/7/2012", "4/1/2009", "Yes", 1, "$700.00", 5, "Bob Hope", "2910 Cord St.", "Tampa", "FL", "33605", "2910 Cord St. Tampa FL 33605", "Houses For You");



        //System.Data.DataTable TenantTable = this.AddTenantsTable(ds); //new System.Data.DataTable("Tenants");

        //System.Data.DataTable ReservationTable = new System.Data.DataTable("Reservations");
        //System.Data.DataTable OwnerTable = this.AddOwnerTable(ds);

        //System.Data.DataTable ContractTable = this.AddContractsTable(ds);


        
        
        

        
        
        
        
       //Reservations
        //System.Data.DataColumn dcReservationTenantID = new System.Data.DataColumn("ResTenantID", typeof(string));
        //ReservationTable.Columns.Add(dcReservationTenantID);

        //System.Data.DataColumn dcReservationUnit = new System.Data.DataColumn("ReservationUnit", typeof(string));
        //ReservationTable.Columns.Add(dcReservationUnit);

        //System.Data.DataColumn dcResUnitType = new System.Data.DataColumn("ResUnitType", typeof(string));
        //ReservationTable.Columns.Add(dcResUnitType);

        //System.Data.DataColumn dcResTenantName = new System.Data.DataColumn("ResTenantName", typeof(string));
        //ReservationTable.Columns.Add(dcResTenantName);

        //System.Data.DataColumn dcResTenantStatus = new System.Data.DataColumn("ResTenantStatus", typeof(string));
        //ReservationTable.Columns.Add(dcResTenantStatus);

        //System.Data.DataColumn dcResTenantDesiredDate = new System.Data.DataColumn("ResTenantDesiredDate", typeof(string));
        //ReservationTable.Columns.Add(dcResTenantDesiredDate);

        //System.Data.DataColumn dcResTenantOrder = new System.Data.DataColumn("ResTenantOrder", typeof(string));
        //ReservationTable.Columns.Add(dcResTenantOrder);

        //System.Data.DataColumn dcResTenantFromDate = new System.Data.DataColumn("ResTenantFromDate", typeof(string));
        //ReservationTable.Columns.Add(dcResTenantFromDate);

        //System.Data.DataColumn dcResTenantToDate = new System.Data.DataColumn("ResTenantToDate", typeof(string));
        //ReservationTable.Columns.Add(dcResTenantToDate);
        //
        //System.Data.DataColumn dcResUnitAddress = new System.Data.DataColumn("ResUnitAddress", typeof(string));
        //ReservationTable.Columns.Add(dcResUnitAddress);

        //this.AddReservationsDataRow(ReservationTable, 1, "1A", "1 Bedroom", "Billy Gibbons", "Active", "10/10/2010", 3, "8/7/2008", "9/7/2009", "N 59th St. Tampa FL  33617");
        //this.AddReservationsDataRow(ReservationTable, 2, "3C", "2 Bedroom", "Fredrick Mercury", "Active", "1/10/2010", 1, "8/4/2005", "8/4/2008", "4214 E Palifox St. Tampa FL 33610");
        //this.AddReservationsDataRow(ReservationTable, 3, "8B", "1 Bedroom", "William Riker", "Active", "3/1/2010", 2, "2/4/2005", "2/4/2009", "7801 Andalusia Pl. Tampa FL 33614");
        
        
        
        
        //ds.Tables.Add(propertyTable);
        //ds.Tables.Add(unitTable);
        //ds.Tables.Add(TenantTable);
        //ds.Tables.Add(ReservationTable);
        //ds.Tables.Add(OwnerTable);

        //this.Application.Add("data", ds);

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
