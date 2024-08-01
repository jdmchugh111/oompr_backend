# README

## Intro

This is the backend repository for Oompr, an application that allows you to "window shop" for luxury real estate listings. Oompr (which is in acronym for Out Of My Price Range) allows users to search by city and be shown the most expensive real estate listings in that city. Users can also log in and save listings, and that list of saved listings is stored in their user dashboard.
<br><br>
[Deployed Application]([url](https://pacific-dusk-48184-9d5b91032508.herokuapp.com/))
<br><br>
[Frontend Respository]([url](https://github.com/jdmchugh111/oompr_frontend))
<br>

## Contributors

[James McHugh]([url](https://github.com/jdmchugh111))
<br><br>
[Rodrigo Chavez]([url](https://github.com/RodrigoACG))
<br><br>
[Zach Bergman]([url](https://github.com/zach-bergman))
<br>

## Database Schema

<img width="425" alt="Screenshot 2024-08-01 at 3 06 58 PM" src="https://github.com/user-attachments/assets/2ed6b421-4f91-455e-8177-1495132a66a2">

<br>

## API Endpoints

### GET /api/v1/properties?city={city}

Returns basic oompr search with most expensive real estate listings in a given city
<br><br>
**Example Request:**
```
https://whispering-cliffs-26803-3cc31fb2a950.herokuapp.com/api/v1/properties?city=Houston
```
**Example Response:**
```
{
    "data": [
        {
            "id": "1005254",
            "type": "listing",
            "attributes": {
                "price": 22790088,
                "address": "60843 South GAITHER WAY CT #18393, Houston, Texas 77532",
                "bedrooms": 4,
                "bathrooms": 2,
                "sqft": 1623,
                "photos": [
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home4.jpg",
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-4.jpg"
                ]
            }
        },
        {
            "id": "1005192",
            "type": "listing",
            "attributes": {
                "price": 20714261,
                "address": "74434 East Sweet Bottom Br #18393, Houston, Texas 77096",
                "bedrooms": 2,
                "bathrooms": 5,
                "sqft": 1043,
                "photos": [
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home9.jpg",
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-9.jpg"
                ]
            }
        },
        {
            "id": "1005191",
            "type": "listing",
            "attributes": {
                "price": 20683471,
                "address": "86469 West Zenith Cliff #F16, Houston, Texas 77007",
                "bedrooms": 4,
                "bathrooms": 3,
                "sqft": 5269,
                "photos": [
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home15.jpg",
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-15.jpg"
                ]
            }
        },
        {
            "id": "1005199",
            "type": "listing",
            "attributes": {
                "price": 20220909,
                "address": "15804 South FM 3 Boulevard #1795, Houston, Texas 77429",
                "bedrooms": 3,
                "bathrooms": 1,
                "sqft": 5607,
                "photos": [
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home6.jpg",
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-6.jpg"
                ]
            }
        }, ...
        
```
### GET /api/v1/properties?city={city}&monthly={monthly income}

Returns "Reality Check" search results, which are limited based on the user's provided monthly income
<br><br>
**Example Request:**
```
https://whispering-cliffs-26803-3cc31fb2a950.herokuapp.com/api/v1/properties?city=Houston&monthly=375000
```
**Example Response:**
```
{
    "data": [
        {
            "id": "1005172",
            "type": "listing",
            "attributes": {
                "price": 18730333,
                "address": "68827 South 99 CT Estates #783, Houston, Texas 77375",
                "bedrooms": 5,
                "bathrooms": 4,
                "sqft": 3477,
                "photos": [
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home4.jpg",
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-4.jpg"
                ]
            }
        },
        {
            "id": "1005245",
            "type": "listing",
            "attributes": {
                "price": 18065342,
                "address": "52876 North Newark Blvd B Trace #2035, Houston, Texas 77429",
                "bedrooms": 4,
                "bathrooms": 6,
                "sqft": 3534,
                "photos": [
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home7.jpg",
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-7.jpg"
                ]
            }
        },
        {
            "id": "1005240",
            "type": "listing",
            "attributes": {
                "price": 17236623,
                "address": "2976 North British Colony Lndg #12306, Houston, Texas 77377",
                "bedrooms": 3,
                "bathrooms": 5,
                "sqft": 4553,
                "photos": [
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home7.jpg",
                    "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-7.jpg"
                ]
            }
        }, ...
```
### GET /api/v1/properties/{listing_id}

Returns a single listing that matches the listing_id
<br><br>
**Example Request:**
```
https://whispering-cliffs-26803-3cc31fb2a950.herokuapp.com/api/v1/properties/1005172
```
**Example Response:**
```
{
    "data": {
        "id": "1005172",
        "type": "listing",
        "attributes": {
            "price": 18730333,
            "address": "68827 South 99 CT Estates #783, Houston, Texas 77375",
            "bedrooms": 5,
            "bathrooms": 4,
            "sqft": 3477,
            "photos": [
                "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home4.jpg",
                "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home-inside-4.jpg"
            ]
        }
    }
}
```
### GET /api/v1/favorites?user={user_id}

Returns all favorites for a given user
<br><br>
**Example Request:**
```
https://whispering-cliffs-26803-3cc31fb2a950.herokuapp.com/api/v1/favorites?user=2
```
**Example Response:**
```
{
    "data": [
        {
            "id": "7",
            "type": "favorite",
            "attributes": {
                "user_id": "2",
                "listing_id": "1005192",
                "address": "74434 East Sweet Bottom Br #18393, Houston, Texas 77096",
                "price": "20714261",
                "picture": "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home9.jpg"
            }
        }
    ]
}
```
### POST /api/v1/favorites?user={user_id}&listing={listing_id}

Creates a new favorite record for a user
<br><br>
**Example Request:**
```
https://whispering-cliffs-26803-3cc31fb2a950.herokuapp.com/api/v1/favorites?user=2&listing=1005219
```
**Example Response:**
```
{
    "data": {
        "id": "34",
        "type": "favorite",
        "attributes": {
            "user_id": "2",
            "listing_id": "1005219",
            "address": "91910 East Somerset N. Knolls #783, Houston, Texas 77008",
            "price": "13717919",
            "picture": "https://s3-us-west-2.amazonaws.com/cdn.simplyrets.com/properties/trial/home12.jpg"
        }
    }
}
```
### DELETE /api/v1/favorites/{favorite_id}

Deletes a favorite record based on backend database id #
<br><br>
**Example Request:**
```
https://whispering-cliffs-26803-3cc31fb2a950.herokuapp.com/api/v1/favorites/34
```
**Example Response: Returns a '204 No Content' with an empty response body**


