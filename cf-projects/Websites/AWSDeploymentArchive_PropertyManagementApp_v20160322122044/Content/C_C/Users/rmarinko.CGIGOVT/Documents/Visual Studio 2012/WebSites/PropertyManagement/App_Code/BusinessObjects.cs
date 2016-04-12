using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BusinessObjects
/// </summary>
public class BusinessObjectContainer
{
	public BusinessObjectContainer()
	{
        //add amenities
        this.AddAmenitiy("Pool");
        this.AddAmenitiy("Hot Tub");
        this.AddAmenitiy("Small Pets Allowed");
        this.AddAmenitiy("Large Pets Allowed");
        this.AddAmenitiy("Television Provided");
        this.AddAmenitiy("Internet Access");
        this.AddAmenitiy("Fitness Center");
        this.AddAmenitiy("Balcony");
        this.AddAmenitiy("Porch");
        this.AddAmenitiy("Private Access");
        this.AddAmenitiy("Recreational Room");
        this.AddAmenitiy("Fireplace");
        this.AddAmenitiy("Vaulted Ceilings");
        this.AddAmenitiy("Kitchen");
        this.AddAmenitiy("Large Mirrors");
        this.AddAmenitiy("Storage Space");
        this.AddAmenitiy("Refrigerator");
        this.AddAmenitiy("Cupboards");
        this.AddAmenitiy("Freezer");
        this.AddAmenitiy("Air Conditioning");

	}
    Random r = new Random(DateTime.Now.Millisecond);
    public List<Amenity> GetRandomAmenities()
    {
        return this.GetRandomAmenities(r.Next(this.Amenities.Count));
    }
    public List<Amenity> GetRandomAmenities(int count)
    {
        List<Amenity> retVal = new List<Amenity>();
        while (count > 0)
        {
            count--;
            int rand = r.Next(this.Amenities.Count);
            while (retVal.Count(x => x.ID == this.Amenities[rand].ID) > 0)
            {
                rand = r.Next(this.Amenities.Count);
            }
            retVal.Add(this.Amenities[rand]);
        }

        return retVal;
    }

    public List<Tenant> FindTenants(string name)
    {
        return this.Tenants.Where(x => x.Name == name).ToList();
    }

    public List<Contract> FindContractCollisions(Tenant t, DateTime start, DateTime end)
    {
        return this.Contracts.Where(x => x.TenantReference.ID == t.ID &&
            ((x.ContractStart <= start && x.ContractEnd >= end)
            || (x.ContractStart >= start && x.ContractEnd <= end)
            || (x.ContractStart <= start && x.ContractEnd >= start)
            || (x.ContractStart <= end && x.ContractEnd >= end))).ToList();
    }

    public Property AddProperty(string name, string address, string city, string state, string zip)
    {
        this.PropertyCounter++;
        Property prop = new Property(this, this.PropertyCounter, null, name, address, city, state, zip);
        this.Properties.Add(prop);
        return prop;
    }
    private int PropertyCounter = 0;

    public Unit AddUnit(Property prop, string unitNo, decimal rent, int beds, int baths)
    {
        this.UnitCounter++;
        Unit unit = new Unit(this, this.UnitCounter, prop, unitNo, rent, beds, baths);
        unit.Amenities = this.GetRandomAmenities();
        this.Units.Add(unit);
       
        return unit;
    }
    private int UnitCounter = 0;

    public Tenant AddTenant(string name, int familySize, string job, int income, string employer)
    {
        this.TenantCounter++;
        Tenant t = new Tenant(this, this.TenantCounter, name, familySize, job, income, employer);
        this.Tenants.Add(t);
        List<Amenity> randomAmenities = this.GetRandomAmenities(this.Amenities.Count / 2);
        int required = r.Next(randomAmenities.Count - 1);
        t.AmenitiesRequired = randomAmenities.Take(required).ToList();
        t.AmenitiesDesired = randomAmenities.Where(x => t.AmenitiesRequired.Count(y => y.ID == x.ID) == 0).ToList();

        return t;
    }
    private int TenantCounter = 0;

    public void AddContract(Unit unit, Tenant tenant, DateTime start, DateTime end, double rent)
    {
        this.ContactCount++;
        this.Contracts.Add(new Contract(this, this.ContactCount, unit, tenant, start, end, rent));
    }
    private int ContactCount = 0;

    public void AddOwner(Property property, string name)
    {
        this.OwnerCount++;
        Owner owner = new Owner(this, this.OwnerCount, name, property.Address, property.City, property.State, property.Zip);
        this.Owners.Add(owner);
        property.OwnerReference = owner;
    }
    private int OwnerCount = 0;

    public Owner AddOwner(string name, string address, string city, string state, string zip)
    {
        this.OwnerCount++;
        Owner owner = new Owner(this, this.OwnerCount, name, address, city, state, zip);
        this.Owners.Add(owner);
        return owner;
    }

    public void AddAmenitiy(string name)
    {
        this.AmenityCount++;
        this.Amenities.Add(new Amenity(this.AmenityCount, name));
    }
    private int AmenityCount = 0;

    public List<Property> Properties { 
        get { return this.PropertiesPrivate; }
        set { this.PropertiesPrivate = value; }
    }
    private List<Property> PropertiesPrivate = new List<Property>();

    public List<Unit> Units { 
        get { return this.UnitsPrivate; }
        set { this.UnitsPrivate = value; }
    }
    private List<Unit> UnitsPrivate = new List<Unit>();

    public List<Tenant> Tenants
    {
        get { return this.TenantsPrivate; }
        set { this.TenantsPrivate = value; }
    }
    private List<Tenant> TenantsPrivate = new List<Tenant>();

    public List<Owner> Owners
    {
        get { return this.OwnersPrivate; }
        set { this.OwnersPrivate = value; }
    }
    private List<Owner> OwnersPrivate = new List<Owner>();

    public List<Contract> Contracts
    {
        get { return this.ContractsPrivate; }
        set { this.ContractsPrivate = value; }
    }
    private List<Contract> ContractsPrivate = new List<Contract>();

    public List<Amenity> Amenities
    {
        get { return this.AmenitiesPrivate; }
        set { this.AmenitiesPrivate = value; }
    }
    private List<Amenity> AmenitiesPrivate = new List<Amenity>();

    public class Property
    {
        public Property(BusinessObjectContainer boc, int id, Owner owner, string name, string address, string city, string state, string zip)
        {
            this.ID = id;
            this.BusinessOjectReference = boc;
            this.OwnerReference = owner;
            this.Name = name;
            this.Address = address;
            this.City = city;
            this.State = state;
            this.Zip = zip;
        }
        public BusinessObjectContainer BusinessOjectReference { 
            get { return this.BusinessOjectReferencePrivate; }
            set { this.BusinessOjectReferencePrivate = value; }
        }
        private BusinessObjectContainer BusinessOjectReferencePrivate;
        public Owner OwnerReference
        {
            get { return this.OwnerReferencePrivate; }
            set { this.OwnerReferencePrivate = value; }
        }
        private Owner OwnerReferencePrivate;
        public int ID
        {
            get { return this.IDPrivate; }
            set { this.IDPrivate = value; }
        }
        private int IDPrivate;
        public string Name { 
            get { return this.NamePrivate; }
            set { this.NamePrivate = value; }
        }
        private string NamePrivate;

        public string Address { 
            get { return this.AddressPrivate; }
            set { this.AddressPrivate = value; }
        }
        private string AddressPrivate;

        public string City { 
            get { return this.CityPrivate; }
            set { this.CityPrivate = value; }
        }
        private string CityPrivate;

        public string State { 
            get { return this.StatePrivate; }
            set { this.StatePrivate = value; }
        }
        private string StatePrivate;

        public string Zip { 
            get { return this.ZipPrivate; }
            set { this.ZipPrivate = value; }
        }
        private string ZipPrivate;

        public List<BusinessObjectContainer.Unit> Units
        {
            get { return this.BusinessOjectReference.Units.Where(x => x.PropertyReference.ID == this.ID).ToList(); }
        }

        public int Occupied
        {
            get { return this.Units.Count(x => x.Contracts.Count(y => y.ContractStart <= System.DateTime.Now && y.ContractEnd >= System.DateTime.Now) > 0); }
        }
        private int OccupiedPrivate;

        public int Vacant
        {
            get { return this.Units.Count - this.Occupied; }
        }
        private int VacantPrivate;

        public int Reserved
        {
            get { return this.Units.Count(x => x.Contracts.Count(y => y.ContractStart > System.DateTime.Now) > 0); }

        }
        private int ReservedPrivate;

        public int UnitCount
        {
            get { return this.Units.Count; }
        }
        private int UnitCountPrivate;

        
    }

    public class Unit
    {
        public Unit(BusinessObjectContainer boc, int id, Property property, string unitNo, decimal rent, int bedrooms, int bathrooms)
        {
            this.ID = id;
            this.BusinessObjectContainer = boc;
            this.PropertyReference = property;
            this.UnitNumber = unitNo;
            this.Rent = rent;
            this.Bedrooms = bedrooms;
            this.Bathrooms = bathrooms;
        }
        public BusinessObjectContainer BusinessObjectContainer { 
            get { return this.BusinessObjectContainerPrivate; }
            set { this.BusinessObjectContainerPrivate = value; }
        }
        private BusinessObjectContainer BusinessObjectContainerPrivate;

        public int ID
        {
            get { return this.IDPrivate; }
            set { this.IDPrivate = value; }
        }
        private int IDPrivate;

        public Property PropertyReference { 
            get { return this.PropertyReferencePrivate; }
            set { this.PropertyReferencePrivate = value; }
        }
        private Property PropertyReferencePrivate;
        public string UnitNumber { 
            get { return this.UnitNumberPrivate; }
            set { this.UnitNumberPrivate = value; }
        }
        private string UnitNumberPrivate;

        public decimal Rent { 
            get { return this.RentPrivate; }
            set { this.RentPrivate = value; }
        }
        private decimal RentPrivate;

        public int Bedrooms { 
            get { return this.BedroomsPrivate; }
            set { this.BedroomsPrivate = value; }
        }
        private int BedroomsPrivate;

        public int Bathrooms { 
            get { return this.BathroomsPrivate; }
            set { this.BathroomsPrivate = value; }
        }
        private int BathroomsPrivate;

        public List<Contract> Contracts
        {
            get { return this.BusinessObjectContainer.Contracts.Where(x => x.UnitReference.ID == this.ID).ToList(); }
        }
        private List<Contract> ContractsPrivate;

        public string Status
        {
            get 
            {
                if (this.Contracts.Where(x => x.ContractStart <= System.DateTime.Now && x.ContractEnd >= System.DateTime.Now).Count() > 0)
                    return "Occupied";
                else if (this.Contracts.Where(x => x.ContractStart >= System.DateTime.Now).Count() > 0)
                    return "Vacant (Reserved)";
                else
                    return "Vacant";
                    
            }
        }

        public Contract CurrentContract
        {
            get 
            {
                return this.Contracts.Where(x => x.ContractStart <= System.DateTime.Now && x.ContractEnd >= System.DateTime.Now).FirstOrDefault();
            }
        }

        public DateTime? CurrentContractStart
        {
            get 
            {
                Contract c = this.CurrentContract;
                if (c == null)
                    return null;
                else
                    return c.ContractStart;
            }
        }
        public DateTime? CurrentContractEnd
        {
            get
            {
                Contract c = this.CurrentContract;
                if (c == null)
                    return null;
                else
                    return c.ContractEnd;
            }
        }

        public DateTime? NextReservedDate
        {
            get
            {
                Contract c = this.Contracts.Where(x => x.ContractStart >= System.DateTime.Now).FirstOrDefault();
                if (c == null)
                    return null;
                else
                    return c.ContractStart;

            }
        }

        public List<Amenity> Amenities
        {
            get { return this.AmenitiesPrivate; }
            set { this.AmenitiesPrivate = value; }
        }
        private List<Amenity> AmenitiesPrivate;


        public int IdealIncomeMin
        {
            get
            {
                if (this.IdealIncomeMinPrivate.HasValue == false)
                {
                    double rentMin = System.Convert.ToDouble(this.Rent) * 36;

                    //round off to 100's
                    rentMin /= 100;

                    rentMin = System.Math.Round(rentMin, 0);

                    rentMin *= 100;

                    this.IdealIncomeMinPrivate = System.Convert.ToInt32(rentMin);
                }
                return this.IdealIncomeMinPrivate.Value;
            }
        }
        private int? IdealIncomeMinPrivate;
        public int IdealIncomeMax
        {
            get
            {
                if (this.IdealIncomeMaxPrivate.HasValue == false)
                {
                    double rentMax = System.Convert.ToDouble(this.Rent) * 48;

                    //round off to 100's
                    rentMax /= 100;

                    rentMax = System.Math.Round(rentMax, 0);

                    rentMax *= 100;

                    this.IdealIncomeMaxPrivate = System.Convert.ToInt32(rentMax);
                }
                return this.IdealIncomeMaxPrivate.Value;
            }
        }
        private int? IdealIncomeMaxPrivate;
        public int IdealIncome
        {
            get
            {
                if (this.IdealIncomePrivate.HasValue == false)
                {
                    double min = System.Convert.ToDouble(this.Rent) * 36;
                    double max = System.Convert.ToDouble(this.Rent) * 48;
                    double difference = max - min;
                    this.IdealIncomePrivate = System.Convert.ToInt32(min + (difference / 2));
                }
                return this.IdealIncomePrivate.Value;
            }
        }
        private int? IdealIncomePrivate;

        public double GetTenantMatch(Tenant tenant)
        {
            //get rent score
            double rentScore = 9;
            if (this.Rent < tenant.IdealRentMin)
            {
                double difference = tenant.IdealRentMin - System.Convert.ToDouble(this.Rent);
                difference /= 500;
                difference = System.Math.Round(difference, 0);
                rentScore = System.Math.Max(8 - difference, 0);
            }
            else if (this.Rent > tenant.IdealRentMax)
            {
                double difference = System.Convert.ToDouble(this.Rent) - tenant.IdealRentMax;
                difference /= 100;
                difference = System.Math.Round(difference, 0);
                rentScore = System.Math.Max(8 - difference, 0);
            }

            //get desired amenity match, max of 1.

            if (tenant.AmenitiesDesired.Count > 0)
            {
                double matched = this.Amenities.Count(x => tenant.AmenitiesDesired.Contains(x));
                rentScore += (matched / tenant.AmenitiesDesired.Count);
            }
            else
            {
                rentScore += 1;
            }

            rentScore /= 10;

            this.TenantMatchPrivate = rentScore;
            return rentScore;

        }

        public double? TenantMatch
        {
            get { return this.TenantMatchPrivate; }
        }
        private double? TenantMatchPrivate;

    }
    public class Tenant
    {

        public Tenant(BusinessObjectContainer boc, int id, string name, int familySize, string job, int income, string employer)
        {
            this.BusinessObjectContainer = boc;
            this.ID = id;
            this.Name = name;
            this.FamilySize = familySize;
            this.Job = job;
            this.Income = income;
            this.Employer = employer;
        }

        public BusinessObjectContainer BusinessObjectContainer
        {
            get { return this.BusinessObjectContainerPrivate; }
            set { this.BusinessObjectContainerPrivate = value; }
        }
        private BusinessObjectContainer BusinessObjectContainerPrivate;

        public int ID
        {
            get { return this.IDPrivate; }
            set { this.IDPrivate = value; }
        }
        private int IDPrivate;

        public string Name
        {
            get { return this.NamePrivate; }
            set { this.NamePrivate = value; }
        }
        private string NamePrivate;

        public int FamilySize
        {
            get { return this.FamilySizePrivate; }
            set { this.FamilySizePrivate = value; }
        }
        private int FamilySizePrivate;

        public string Job
        {
            get { return this.JobPrivate; }
            set { this.JobPrivate = value; }
        }
        private string JobPrivate;

        public int Income
        {
            get { return this.IncomePrivate; }
            set { this.IncomePrivate = value; }
        }
        private int IncomePrivate;

        public int IdealRentMin
        {
            get 
            {
                if (this.IdealRentMinPrivate.HasValue == false)
                {
                    double rentMin = System.Convert.ToDouble(this.Income) / 48;

                    //round off to 10's
                    rentMin /= 10;

                    rentMin = System.Math.Round(rentMin, 0);

                    rentMin *= 10;

                    this.IdealRentMinPrivate = System.Convert.ToInt32(rentMin);
                }
                return this.IdealRentMinPrivate.Value; 
            }
        }
        private int? IdealRentMinPrivate;
        public int IdealRentMax
        {
            get
            {
                if (this.IdealRentMaxPrivate.HasValue == false)
                {
                    double rentMax = System.Convert.ToDouble(this.Income) / 36;

                    //round off to 10's
                    rentMax /= 10;

                    rentMax = System.Math.Round(rentMax, 0);

                    rentMax *= 10;

                    this.IdealRentMaxPrivate = System.Convert.ToInt32(rentMax);
                }
                return this.IdealRentMaxPrivate.Value;
            }
        }
        private int? IdealRentMaxPrivate;
        public int IdealRent
        {
            get 
            {
                if (this.IdealRentPrivate.HasValue == false)
                {
                    double min = System.Convert.ToDouble(this.Income) / 48;
                    double max = System.Convert.ToDouble(this.Income) / 36;
                    double difference = max - min;
                    this.IdealRentPrivate = System.Convert.ToInt32(min + (difference / 2));
                }
                return this.IdealRentPrivate.Value; 
            }
        }
        private int? IdealRentPrivate;

        public double GetUnitMatch(Unit unit)
        {
            //get rent score
            double rentScore = 9;
            if (this.Income < unit.IdealIncomeMin)
            {
                double difference = unit.IdealIncomeMin - this.Income;
                difference /= 5000;
                difference = System.Math.Round(difference, 0);
                rentScore = System.Math.Max(8 - difference, 0);
            }
            else if (this.Income > unit.IdealIncomeMax)
            {
                double difference = this.Income - unit.IdealIncomeMax ;
                difference /= 10000;
                difference = System.Math.Round(difference, 0);
                rentScore = System.Math.Max(8 - difference, 0);
            }

            //get desired amenity match, max of 1.

            if (this.AmenitiesDesired.Count > 0)
            {
                double matched = unit.Amenities.Count(x => this.AmenitiesDesired.Contains(x));
                rentScore += (matched / this.AmenitiesDesired.Count);
            }
            else
            {
                rentScore += 1;
            }

            rentScore /= 10;

            this.UnitMatchPrivate = rentScore;
            return rentScore;

        }

        public double? UnitMatch
        {
            get { return this.UnitMatchPrivate; }
        }
        private double? UnitMatchPrivate;


        public string Employer
        {
            get { return this.EmployerPrivate; }
            set { this.EmployerPrivate = value; }
        }
        private string EmployerPrivate;

        public List<Contract> Contracts
        {
            get { return this.BusinessObjectContainer.Contracts.Where(x => x.TenantReference.ID == this.ID).ToList(); }
        }
        private List<Contract> ContractsPrivate;

        public Contract CurrentContract
        {
            get
            {
                return this.Contracts.OrderByDescending(x => x.ContractStart).FirstOrDefault();
            }
        }

        public Unit CurrentUnit
        {
            get 
            {
                Contract c = this.Contracts.OrderByDescending(x => x.ContractStart).FirstOrDefault();
                if (c != null)
                    return c.UnitReference;
                else
                    return null;
            }
        }
        public Property CurrentProperty
        { 
            get 
            {
                if (this.CurrentUnit == null)
                    return null;
                else
                    return this.CurrentUnit.PropertyReference;
            } 
        }

        public DateTime? CurrentContractStart
        {
            get
            {
                Contract c = this.CurrentContract;
                if (c == null)
                    return null;
                else
                    return c.ContractStart;
            }
        }
        public DateTime? CurrentContractEnd
        {
            get
            {
                Contract c = this.CurrentContract;
                if (c == null)
                    return null;
                else
                    return c.ContractEnd;
            }
        }

        public string Status
        {
            get
            {
                Contract c = this.CurrentContract;
                if (c == null)
                    return "Waiting List";
                else if (c.ContractEnd < System.DateTime.Now)
                    return "Former Tenant";
                else
                    return "Active";
            }
        }
        private string StatusPrivate;


        public List<Amenity> AmenitiesRequired
        {
            get { return this.AmenitiesRequiredPrivate; }
            set { this.AmenitiesRequiredPrivate = value; }
        }
        private List<Amenity> AmenitiesRequiredPrivate;

        public List<Amenity> AmenitiesDesired
        {
            get { return this.AmenitiesDesiredPrivate; }
            set { this.AmenitiesDesiredPrivate = value; }
        }
        private List<Amenity> AmenitiesDesiredPrivate;
    }
    public class Owner
    {
        public Owner(BusinessObjectContainer boc, int id, string name, string address, string city, string state, string zip)
        {
            this.BusinessObjectContainer = boc;
            this.ID = id;
            this.Name = name;
            this.Address = address;
            this.City = city;
            this.State = state;
            this.Zip = zip;
        }
        public BusinessObjectContainer BusinessObjectContainer
        {
            get { return this.BusinessObjectContainerPrivate; }
            set { this.BusinessObjectContainerPrivate = value; }
        }
        private BusinessObjectContainer BusinessObjectContainerPrivate;

        public int ID
        {
            get { return this.IDPrivate; }
            set { this.IDPrivate = value; }
        }
        private int IDPrivate;
        public List<Property> Properties
        {
            get { return this.BusinessObjectContainer.Properties.Where(x => x.OwnerReference.ID == this.ID).ToList(); }
        }
        public string Name
        {
            get { return this.NamePrivate; }
            set { this.NamePrivate = value; }
        }
        private string NamePrivate;

        public string Address
        {
            get { return this.AddressPrivate; }
            set { this.AddressPrivate = value; }
        }
        private string AddressPrivate;

        public string City
        {
            get { return this.CityPrivate; }
            set { this.CityPrivate = value; }
        }
        private string CityPrivate;

        public string State
        {
            get { return this.StatePrivate; }
            set { this.StatePrivate = value; }
        }
        private string StatePrivate;

        public string Zip
        {
            get { return this.ZipPrivate; }
            set { this.ZipPrivate = value; }
        }
        private string ZipPrivate;

        public int PropertyCount 
        { get
            {
                return this.BusinessObjectContainer.Properties.Count(x => x.OwnerReference != null && x.OwnerReference.ID == this.ID);
            } 
        }
    }
    public class Contract
    {
        public Contract(BusinessObjectContainer boc, int id, Unit unit, Tenant tenant, DateTime start, DateTime end, double rent)
        {
            this.ID = id;
            this.BusinessObjectContainer = boc;
            this.UnitReference = unit;
            this.TenantReference = tenant;
            this.Rent = rent;
            this.ContractStart = start;
            this.ContractEnd = end;
        }
        public BusinessObjectContainer BusinessObjectContainer { 
            get { return this.BusinessObjectContainerPrivate; }
            set { this.BusinessObjectContainerPrivate = value; }
        }
        private BusinessObjectContainer BusinessObjectContainerPrivate;

        public int ID
        {
            get { return this.IDPrivate; }
            set { this.IDPrivate = value; }
        }
        private int IDPrivate;

        public Unit UnitReference { 
            get { return this.UnitReferencePrivate; }
            set { this.UnitReferencePrivate = value; }
        }
        private Unit UnitReferencePrivate;

        public Tenant TenantReference
        {
            get { return this.TenantReferencePrivate; }
            set { this.TenantReferencePrivate = value; }
        }
        private Tenant TenantReferencePrivate;

        public DateTime ContractStart
        {
            get { return this.ContractStartPrivate; }
            set { this.ContractStartPrivate = value; }
        }
        private DateTime ContractStartPrivate;

        public DateTime ContractEnd
        {
            get { return this.ContractEndPrivate; }
            set { this.ContractEndPrivate = value; }
        }
        private DateTime ContractEndPrivate;

        public double Rent
        {
            get { return this.RentPrivate; }
            set { this.RentPrivate = value; }
        }
        private double RentPrivate;

        public string Status
        {
            get 
            {
                if (this.ContractEnd < DateTime.Now)
                    return "Completed";
                else if (this.ContractStart > DateTime.Now)
                    return "Reservation";
                else
                    return "Active";
            }
        }
    }

    public class Amenity
    {
        public Amenity(int id, string name)
        {
            this.ID = id;
            this.Name = name;
        }
        public int ID
        {
            get { return this.IDPrivate; }
            set { this.IDPrivate = value; }
        }
        private int IDPrivate;

        public string Name
        {
            get { return this.NamePrivate; }
            set { this.NamePrivate = value; }
        }
        private string NamePrivate;
    }

}
