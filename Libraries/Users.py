from datetime import datetime, timedelta
import random
import requests

class Users():

    def get_api_users(self):
        response = requests.get("https://jsonplaceholder.typicode.com/users", verify=False)

        users = response.json()

        for user in users:
            random_days = random.randint(0, 365 * 50)
            random_date = datetime(1970, 1, 1) + timedelta(days=random_days)
            user['birthday'] = random_date.strftime('%m%d%Y')
            user['address']['state'] = self.get_random_word()
        return users
    
    def get_random_word(self):
        response = requests.get("https://random-word-api.herokuapp.com/word", verify=False)
        print(response.json())
        return response.json()[0].title()