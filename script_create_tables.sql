CREATE TABLE fact_flights (
   id serial primary key,
	passenger int8,
	departure_date int8,
	arrival_date int8,
	departure_delay float8,
	arrival_delay float8,
	aircraft_model int8 NOT NULL,
	departure_airport int8 NOT NULL,
	arrival_airport int8 NOT NULL,
	fare_conditions int8 NOT NULL,
	ticket_price float8 null,
	constraint depar_date_fkey foreign key (departure_date) references dim_calendar (id),
	constraint arrival_date_fkey foreign key (arrival_date) references dim_calendar (id),
	constraint passengers_fkey foreign key (passenger) references dim_passengers (id),
	constraint aircrafts_fkey foreign key (aircraft_model) references dim_aircrafts (id),
	constraint airports_dep_fkey foreign key (departure_airport) references dim_airports (id),
	constraint airports_arr_fkey foreign key (arrival_airport) references dim_airports (id),
	constraint tariff_fkey foreign key (fare_conditions) references dim_tariff (id)
);

CREATE TABLE rejected_fact_flights (
	passenger varchar(250),
	departure_date varchar(250),
	arrival_date varchar(250),
	departure_delay varchar(250),
	arrival_delay varchar(250),
	aircraft_model varchar(250),
	departure_airport varchar(250),
	arrival_airport varchar(250),
	fare_conditions varchar(250),
	ticket_price varchar(250)
);

CREATE TABLE dim_calendar (
   id serial primary key,
   flight_no char(6),
   actual_date timestamptz not null
);

CREATE TABLE rejected_dim_calendar (
   id serial primary key,
   flight_no char(6),
   actual_date timestamptz
);

CREATE TABLE dim_passengers  (
   id serial primary key,
   passenger_name text not null
);

CREATE TABLE dim_aircrafts  (
   id serial primary key,
   aircrafts_code char(3),
   aircrafts_model text not null
);

CREATE TABLE dim_airports  (
   id serial primary key,
   airport_code char(3),
   airport_name text not null
);

CREATE TABLE dim_tariff  (
   id serial primary key,
   fare_conditions varchar(10) not null
);




