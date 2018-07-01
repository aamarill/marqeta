Application_Token   = "user34011530377421"
Master_Access_Token = "02375fa8-e617-4519-847f-ec4acaf8bc87"
My_shared_environment_base_URL =  "https://shared-sandbox-api.marqeta.com/v3/"


# Create objects
# Create card product
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Authorization: Basic dXNlcjM0MDExNTMwMzc3NDIxOjAyMzc1ZmE4LWU2MTctNDUxOS04NDdmLWVjNGFjYWY4YmM4Nw==' -d '{
   "start_date": "2017-01-01",
   "name": "Example Card Product",
   "config": {
     "fulfillment": {
       "payment_instrument":"VIRTUAL_PAN"
      },
     "poi": {
       "ecommerce": true
     },
     "card_life_cycle": {
       "activate_upon_issue": true
     }
   }
 }' 'https://shared-sandbox-api.marqeta.com/v3/cardproducts'

 
