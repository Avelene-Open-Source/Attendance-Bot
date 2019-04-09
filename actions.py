from __future__ import absolute_import
from __future__ import division
from __future__ import unicode_literals

import logging
import re
import pymysql

from sqlalchemy import create_engine
from rasa_core_sdk import Action
from rasa_core_sdk.events import SlotSet, FollowupAction

logger = logging.getLogger(__name__)


class ActionValidateSRN(Action):
    def name(self):
        return "action_validateSRN"

    def run(self, dispatcher, tracker, domain):
        srn = tracker.get_slot("SRN")
        if srn is None:
            dispatcher.utter_message("Please provide your SRN Value.")
            return [FollowupAction("action_listen")]
        else:
            srn = srn.lower()
            if srn[0] == 'r' and 13 <= int(srn[1:3]) <= 19 and 0 <= int(srn[-3:-2]) <= 9 and 0 <= int(
                    srn[-2:-1]) <= 9 and 1 <= int(srn[-1:]) <= 9 and srn[3:-3] in ['cs', 'me', 'cv', 'eee', 'ec']:
                return [FollowupAction("action_getAttendance")]
            else:
                dispatcher.utter_message("Please provide your correct SRN Value.")
                return [FollowupAction("action_listen")]


class ActionGetAttendance(Action):
    def name(self):
        return "action_getAttendance"

    def run(self, dispatcher, tracker, domain):
        engine = create_engine("mysql+pymysql:skilrock//root:@localhost/uniDb?charset=utf8")
        con = engine.connect()
        srn = tracker.get_slot("SRN")
        branch_code = srn[3:5]
        table_name = branch_code + "_attendance"
        querry = "SELECT days_attended/days_total*100 FROM uniDb.{} where srn = '{}';".format(table_name, srn)
        result_generator = engine.execute(querry)
        for i in result_generator:
            dispatcher.utter_message(f"Your attendence is: {i[0]}%")
        # return [SlotSet("first_name", first_name), FollowupAction("utter_lastname")]
