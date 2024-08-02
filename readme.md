# sample timer azure function roass-status-updater

This is a typescript node time triggered azure functions called roass_status_updater.
- uses node programming model v4

GET https://{function-app-name}.azurewebsites.net/admin/functions/roass_status_updater 
returns 200 OK and the data about the function
Example response:
```
{
    "name": "oass_status_updater",
    "script_root_path_href": null,
    "script_href": "https://{function-app-name}.azurewebsites.net/admin/vfs/site/wwwroot/import.js",
    "config_href": null,
    "test_data_href": "https://{function-app-name}.azurewebsites.net/admin/vfs/data/Functions/sampledata/oass_status_updater.dat",
    "href": "https://{function-app-name}.azurewebsites.net/admin/functions/oass_status_updater",
    "invoke_url_template": null,
    "language": "node",
    "config": {
        "name": "oass_status_updater",
        "entryPoint": "",
        "scriptFile": "import.js",
        "language": "node",
        "functionDirectory": "C:\\home\\site\\wwwroot\\dist\\functions\\events",
        "bindings": [
            {
                "schedule": "0 1 * * *",
                "type": "timerTrigger",
                "name": "timerTrigger1",
                "direction": "in"
            },
            {
                "schedule": "0 1 * * *",
                "type": "timerTrigger",
                "name": "timerTrigger1",
                "direction": "in"
            }
        ]
    },
    "files": null,
    "test_data": "",
    "isDisabled": false,
    "isDirect": false,
    "isProxy": false
}
```json

POST https://{function-app-name}.azurewebsites.net/admin/roass_status_updater 
should trigger the function and return 202 Accepted and in the azure portal under Monitor Tab it should show that it has been executed. 


To call the function, also the following header values are required:
```
Name value
x-functions-key	The master key value pasted from the clipboard.
Content-Type	application/json
```

This function has two bindings: once a schedule and also a manual one for testing purposes.

Run locally:
`npm i && npm run start`

Run in docker container:
` docker-compose -f dev.docker-compose.yaml --env-file .env build && docker-compose -f dev.docker-compose.yaml --env-file .env up`

# Resources:
https://learn.microsoft.com/en-us/azure/azure-functions/functions-manually-run-non-http?tabs=azure-portal#call-the-function
https://github.com/MicrosoftDocs/azure-docs/issues/111928
https://learn.microsoft.com/en-us/azure/azure-functions/functions-create-function-app-portal?pivots=programming-language-typescript
