/*
Debido a como hemos establecido las relaciones debemos completar las tablas en el siguinte orden:
1 - Salesman / Customer
2 - Invoices
3 - Cars

*/

insert into salesman (Salesman_ID, Name, Store)
	values ("00001", "Petey Cruiser", "Madrid"),
		   ("00002", "Anna Sthesia", "Barcelona"),
           ("00003", "Paul Molive", "Berlin"),
           ("00004", "Gail Forcewind", "Paris"),
           ("00005", "Paige Turner", "Mimia"),
           ("00006", "Bob Frapples", "Meximo City"),
           ("00007", "Walter Melon", "Amsterdam"),
           ("00008", "Shonda Leer", "São Paulo");
           
insert into customers (Customer_ID, 
					   Name,
                       Phone,
                       City,
                       Province,
                       Country,
					   `Postal Code`,
                       Email,
                       Adress)
	values ("10001", "Pablo Picasso", "+34636176382", "Madrid","Madrid","Spain",28045,"-","Paseo de la Chopera, 14"),
		   ("20001", "Hedy Lamarr", "+431514442250", "Viena","Viena","Austria",1150,"-","Weiglgasse 10"),
           ("30001", "Katherine Johnson", "+12023580000", "Washington, DC","Washington","United States",20546,"-","300 E St SW");

insert into invoices (Number, 
					  Date, 
                      Id_Sales,
                      Id_Customers)
	values (852399038, "2018-08-22",4,2),
		   (731166526, "2018-12-31",6,1),
           (271135104, "2019-01-22",8,3);
           
insert into cars (VIN,
				  Manufacturer,
                  Model,
                  Year,
                  Color,
                  ID_Invoices)
	values ("3K096I98581DHSNUP","Volkswagen","Tiguan",2019,"Blue",1),
           ("ZM8G7BEUQZ97IH46V","Peugeot","Rifter",2019,"Red",2),
           ("RKXVNNIHLVVZOUB4M","Ford","Fusion",2018,"White",3),
           ("HKNDGS7CU31E9Z7JW","Toyota","RAV4",2018,"Silver",3),
           ("DAM41UDN3CHU2WVF6","Volvo","V60",2019,"Gray",2);
