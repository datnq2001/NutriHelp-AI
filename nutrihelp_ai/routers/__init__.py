from .medical_report_api import router as medical_report_api
from .chatbot_api import router as chatbot_api
from .health_plan_api import router as health_plan_api
from .finetune_api import router as finetune_api
from .meal_plan_api import router as meal_plan_api
from .meal_log_api import router as meal_log_api

__all__ = [
    "medical_report_api",
    "chatbot_api",
    "health_plan_api",
    "finetune_api",
    "meal_plan_api",
    "meal_log_api",
]
