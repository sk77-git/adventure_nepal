class ApiUrls {
  // static const String baseUrl = "https://dit-connect.ditagtech.com/api/";
  static const String baseUrl = "https://test-dit-connect.ditagtech.com/api/";

  static const String login = "token";
  static const String vehicleMaintenanceTypes = "vehicle-maintenance-types";
  static const String fleetMaintenances = "fleet-maintenances";
  static const String vehicles = "vehicles";
  static const String myToilList = "toil?user_id=";
  static const String toApproveToilList = "toil?approver_id=";
  static const String approveToil = "toil/";
  static const String toilApprovers = 'users?filter-by-type=approve_toil';

  // static const String admins = 'users?filter-by-role=admin';
  // static const String user = 'users';
  static const String suppliers = 'suppliers';
  static const String sds = 'sds';
  static const String policy = 'policy';
  static const String acceptPolicy = 'policy/user-policy-create';
  static const String rndCreate = "rnd/store";
  static const String rndList = "rnd";
  static const String activities = "activities";
  static const String purchaseRequestCreate = "purchase-request/store";
  static const String purchaseRequest = "purchase-request";
  static const String purchaseRequestDetail = "purchase-request/show";
  static const String purchaseRequestUpdate = "purchase-request/update/";
  static const String purchaseRequestFilesUpdate = "purchase-request/";
  static const String prApprovers =
      "users?filter-by-type=approve_purchase_request";
  static const String notifications = "notifications";
  static const String notificationsUnreadCount = "notifications/unread-count";
  static const String notificationsMarkAsRead = "notifications/";
  static const String notificationsMarkAllAsRead =
      "notifications/mark-all-as-read";
  static const String templates = "templates";
  static const String responseSets = "response-sets";
}
