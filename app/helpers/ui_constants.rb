module UiConstants
  # Session data size logging constants
  case Rails.env
  when "test"
    SESSION_LOG_THRESHOLD = 50.kilobytes
    SESSION_ELEMENT_THRESHOLD = 5.kilobytes
  when "development"
    SESSION_LOG_THRESHOLD = 50.kilobytes
    SESSION_ELEMENT_THRESHOLD = 5.kilobytes
  else
    SESSION_LOG_THRESHOLD = 100.kilobytes
    SESSION_ELEMENT_THRESHOLD = 10.kilobytes
  end

  # MAX_NAME_LEN = 20      # Default maximum name length
  # MAX_DESC_LEN = 50      # Default maximum description length
  # MAX_HOSTNAME_LEN = 50  # Default maximum host name length
  # dac - Changed to allow up to 255 characters for all text fields on 1/11/07
  MAX_NAME_LEN = 255        # Default maximum name length
  MAX_DESC_LEN = 255        # Default maximum description length
  MAX_HOSTNAME_LEN = 255    # Default maximum host name length

  MAX_DASHBOARD_COUNT = 10  # Default maximum count of Dashboard per group

  REPORTS_FOLDER = File.join(Rails.root, "product/reports")
  CHARTS_REPORTS_FOLDER = File.join(Rails.root, "product/charts/miq_reports")
  CHARTS_LAYOUTS_FOLDER = File.join(Rails.root, "product/charts/layouts")
  TIMELINES_FOLDER = File.join(Rails.root, "product/timelines")
  TOOLBARS_FOLDER = File.join(Rails.root, "product/toolbars")

  TOP_TABLES_BY_ROWS_COUNT = 5
  TOP_TABLES_BY_SIZE_COUNT = 5
  TOP_TABLES_BY_WASTED_SPACE_COUNT = 5
  GIGABYTE = 1024 * 1024 * 1024

  # PDF page sizes
  PDF_PAGE_SIZES = {
    "a0"            => N_("A0 - 841mm x 1189mm"),
    "a1"            => N_("A1 - 594mm x 841mm"),
    "a2"            => N_("A2 - 420mm x 594mm"),
    "a3"            => N_("A3 - 297mm x 420mm"),
    "a4"            => N_("A4 - 210mm x 297mm (default)"),
    "US-Letter"     => N_("US Letter - 8.5in x 11.0in"),
    "US-Legal"      => N_("US Legal - 8.5in x 14.0in"),
    "US-Executive"  => N_("US Executive - 7.25in x 10.5in"),
    "US-Ledger"     => N_("US Ledger - 17.0in x 11.0in"),
    "US-Tabloid"    => N_("US Tabloid - 11.0in x 17.0in"),
    "US-Government" => N_("US Government - 8.0in x 11.0in"),
    "US-Statement"  => N_("US Statement - 5.5in x 8.5in"),
    "US-Folio"      => N_("US Folio - 8.5in x 13.0in")
  }
  DEFAULT_PDF_PAGE_SIZE = "US-Letter"

  # Per page choices and default
  PPCHOICES = [
    [N_("5"), 5],
    [N_("10"), 10],
    [N_("20"), 20],
    [N_("50"), 50],
    [N_("100"), 100],
    [N_("200"), 200],
    [N_("500"), 500],
    [N_("1000"), 1000]
  ]

  # Per page choices for task/jobs
  PPCHOICES2 = [
    [5, 5],
    [10, 10],
    [20, 20],
    [50, 50],
    [100, 100],
  ]

  # Setting high number incase we don't want to display paging controls on list views
  ONE_MILLION = 1000000

  # RSS Feeds
  RSS_FEEDS = {
    "Microsoft Security"         => "http://www.microsoft.com/protect/rss/rssfeed.aspx",
    "CNN Top Stories"            => "http://rss.cnn.com/rss/cnn_topstories.rss",
    "Gartner Latest Research"    => "http://www.gartner.com/it/rss/leaders/latest_research_itoperations.jsp#",
    "Google News"                => "http://news.google.com/?output=rss",
    "SlashDot"                   => "http://slashdot.org/index.rdf",
    "VM Etc."                    => "http://feeds.feedburner.com/vmetc?format=xml",
    "Virtualization Pro"         => "http://itknowledgeexchange.techtarget.com/virtualization-pro/feed/",
    "Virtualization Information" => "http://virtualizationinformation.com/?feed=rss2",
    "Vmware Tips & Tricks"       => "http://rss.techtarget.com/840.xml",
    "DABCC - News & Support"     => "http://feeds.dabcc.com/AllArticles",
    "VmwareWolf"                 => "http://feeds.feedburner.com/vmwarewolf",
    "Vmware RSS Feeds"           => "http://vmware.simplefeed.net/rss?f=995b0290-01dc-11dc-3032-0019bbc54f6f"
  }

  # UI Themes
  THEMES =  [
    [_("Red"), "red"],
    [_("Orange"), "orange"],
    [_("Yellow"), "yellow"],
    [_("Green"), "green"],
    [_("Blue"), "blue"],
    [_("ManageIQ-Blue"), "manageiq-blue"],
    [_("Black"), "black"]
  ]

  # Screen background color choices
  BG_COLORS = [
    "#c00",      # First entry is the default
    "#ff8a00",
    "#ffe400",
    "#6b9130",
    "#0c7ad7",
    "#000"
  ]

  # Navigation Styles
  NAV_STYLES = [
    "vertical",     # First entry is the default
    "wedged"
  ]

  # Theme settings - each subitem will be set in @settings[:css][:<subitem>] based on the selected theme
  THEME_CSS_SETTINGS = {
    "red"           => {
      :font_color       => "#c00",
      :background_color => "#c00"
    },
    "orange"        => {
      :font_color       => "#ff8a00",
      :background_color => "#ff8a00"
    },
    "yellow"        => {
      :font_color       => "#ffe400",
      :background_color => "#ffe400"
    },
    "green"         => {
      :font_color       => "#6b9130",
      :background_color => "#6b9130"
    },
    "blue"          => {
      :font_color       => "#0c7ad7",
      :background_color => "#0c7ad7"
    },
    "manageiq-blue" => {
      :font_color       => "#0c7ad7",
      :background_color => "#187aa2"
    },
    "black"         => {
      :font_color       => "#000",
      :background_color => "#000"
    }
  }

  PERPAGE_TYPES = %w(grid tile list reports).each_with_object({}) { |value, acc| acc[value] = value.to_sym }.freeze

  # Default UI settings
  DEFAULT_SETTINGS = {
    :quadicons => { # Show quad icons, by resource type
      :service         => true,
      :ems             => true,
      :ems_cloud       => true,
      :host            => true,
      :miq_template    => true,
      :physical_server => true,
      :storage         => true,
      :vm              => true
    },
    :views     => { # List view setting, by resource type
      :authkeypaircloud                         => "list",
      :availabilityzone                         => "list",
      :hostaggregate                            => "list",
      :catalog                                  => "list",
      :cm_providers                             => "list",
      :cm_configured_systems                    => "list",
      :compare                                  => "expanded",
      :compare_mode                             => "details",
      :condition                                => "list",
      :container                                => "list",
      :containergroup                           => "list",
      :containernode                            => "list",
      :containerservice                         => "list",
      :containerroute                           => "list",
      :containerproject                         => "list",
      :containerreplicator                      => "list",
      :containerimage                           => "list",
      :containerimageregistry                   => "list",
      :persistentvolume                         => "list",
      :containerbuild                           => "list",
      :containertemplate                        => "list",
      :cloudobjectstorecontainer                => "list",
      :cloudobjectstoreobject                   => "list",
      :cloudtenant                              => "list",
      :cloudvolume                              => "list",
      :cloudvolumebackup                        => "list",
      :cloudvolumesnapshot                      => "list",
      :drift                                    => "expanded",
      :drift_mode                               => "details",
      :emscluster                               => "grid",
      :emscontainer                             => "grid",
      :filesystem                               => "list",
      :flavor                                   => "list",
      :host                                     => "grid",
      :job                                      => "list",
      :manageiq_providers_cloudmanager          => "grid",
      :manageiq_providers_cloudmanager_template => "list",
      :manageiq_providers_cloudmanager_vm       => "grid",
      :manageiq_providers_containermanager      => "grid",
      :manageiq_providers_inframanager          => "grid",
      :manageiq_providers_inframanager_vm       => "grid",
      :manageiq_providers_inframanager_template => "list",
      :manageiq_providers_middlewaremanager     => "grid",
      :manageiq_providers_storagemanager        => "list",
      :middlewaredatasource                     => "list",
      :middlewaredeployment                     => "list",
      :middlewaredomain                         => "list",
      :middlewaremessaging                      => "list",
      :middlewareserver                         => "list",
      :middlewareservergroup                    => "list",
      :miqaction                                => "list",
      :miqaeclass                               => "list",
      :miqaeinstance                            => "list",
      :miqevent                                 => "list",
      :miqpolicy                                => "list",
      :miqpolicyset                             => "list",
      :miqreportresult                          => "list",
      :miqrequest                               => "list",
      :miqtemplate                              => "list",
      :orchestrationstack                       => "list",
      :orchestrationtemplate                    => "list",
      :servicetemplate                          => "list",
      :storagemanager                           => "list",
      :miqtask                                  => "list",
      :ms                                       => "grid",
      :policy                                   => "list",
      :policyset                                => "grid",
      :resourcepool                             => "grid",
      :service                                  => "grid",
      :scanhistory                              => "list",
      :storage_files                            => "list",
      :summary_mode                             => "dashboard",
      :registryitems                            => "list",
      :serverbuild                              => "list",
      :storage                                  => "grid",
      :tagging                                  => "grid",
      :treesize                                 => "20",
      :vm                                       => "grid",
      :vmortemplate                             => "grid",
      :vmcompare                                => "compressed"
    },
    :perpage   => { # Items per page, by view setting
      :grid    => 20,
      :tile    => 20,
      :list    => 20,
      :reports => 20
    },
    :topology  => {
      :containers_max_items => 100
    },
    :display   => {
      :startpage     => "/dashboard/show",
      :reporttheme   => "MIQ",
      :quad_truncate => "m",
      :theme         => "red",            # Luminescent Blue
      :bg_color      => BG_COLORS.first,  # Background color
      :taskbartext   => true,             # Show button text on taskbar
      :vmcompare     => "Compressed",     # Start VM compare and drift in compressed mode
      :hostcompare   => "Compressed",     # Start Host compare in compressed mode
      :nav_style     => NAV_STYLES.first,  # Navigation style
      :timezone      => nil,               # This will be set when the user logs in
      :display_vms   => false # don't display vms by default
    },
    # Commented in sprint 67 - new widget based dashboards
    #    :dashboard => {
    #      :col_1   =>  ["rss1", "chart1"],               # Column 1 contents
    #      :col_2   =>  ["chart2", "rss2"],               # Column 2 contents
    #      :col_3   =>  ["report1", "report2", "rss3"],   # Column 3 contents
    #      :rssshow =>  false,                            # Show external rss feed
    #      :rssfeed =>  "Microsoft Security"              # External rss feed choice
    #    },
    #    :db_item_min => Hash.new # Start with blank hash to hold dashboard item minimized flags
  }

  VIEW_RESOURCES = DEFAULT_SETTINGS[:views].keys.each_with_object({}) { |value, acc| acc[value.to_s] = value }.freeze

  TIMER_DAYS = [
    [N_("Day"), "1"],
    [N_("2 Days"), "2"],
    [N_("3 Days"), "3"],
    [N_("4 Days"), "4"],
    [N_("5 Days"), "5"],
    [N_("6 Days"), "6"],
  ]
  TIMER_HOURS = [
    [N_("Hour"), "1"],
    [N_("2 Hours"), "2"],
    [N_("3 Hours"), "3"],
    [N_("4 Hours"), "4"],
    [N_("6 Hours"), "6"],
    [N_("8 Hours"), "8"],
    [N_("12 Hours"), "12"],
  ]
  TIMER_WEEKS = [
    [N_("Week"), "1"],
    [N_("2 Weeks"), "2"],
    [N_("3 Weeks"), "3"],
    [N_("4 Weeks"), "4"],
  ]
  TIMER_MONTHS = [
    [N_("Month"), "1"],
    [N_("2 Months"), "2"],
    [N_("3 Months"), "3"],
    [N_("4 Months"), "4"],
    [N_("5 Months"), "5"],
    [N_("6 Months"), "6"],
  ]

  # Maximum fields to show for automation engine resolution screens
  AE_MAX_RESOLUTION_FIELDS = 5

  DRIFT_TIME_COLUMNS = [
    "last_scan_on",
    "boot_time",
    "last_logon"
  ]
  # START of TIMELINE TIMEZONE Code
  TIMELINE_TIME_COLUMNS = [
    "created_on",
    "timestamp"
  ]
  # END of TIMELINE TIMEZONE Code

  # Choices for trend and C&U days back pulldowns
  WEEK_CHOICES = {
    7  => N_("1 Week"),
    14 => N_("2 Weeks"),
    21 => N_("3 Weeks"),
    28 => N_("4 Weeks")
    # 60 => "2 Months",   # Removed longer times when on demand daily rollups was added in sprint 59 due to performance
    # 90 => "3 Months",
    # 180 => "6 Months"
  }

  # Choices for C&U last hour real time minutes back pulldown
  REALTIME_CHOICES = {
    10.minutes => N_("10 Minutes"),
    15.minutes => N_("15 Minutes"),
    30.minutes => N_("30 Minutes"),
    45.minutes => N_("45 Minutes"),
    1.hour     => N_("1 Hour")
  }

  # Choices for Target options show pulldown
  TARGET_TYPE_CHOICES = {
    "EmsCluster" => N_("Clusters"),
    "Host"       => N_("Hosts")
  }

  # Choices for the trend limit percent pulldowns
  TREND_LIMIT_PERCENTS = {
    "200%" => 200,
    "190%" => 190,
    "180%" => 180,
    "170%" => 170,
    "160%" => 160,
    "150%" => 150,
    "140%" => 140,
    "130%" => 130,
    "120%" => 120,
    "110%" => 110,
    "100%" => 100,
    "95%"  => 95,
    "90%"  => 90,
    "85%"  => 85,
    "80%"  => 80,
    "75%"  => 75,
    "70%"  => 70,
    "65%"  => 65,
    "60%"  => 60,
    "55%"  => 55,
    "50%"  => 50,
  }

  # Report Controller constants
  NOTHING_STRING = "<<< Nothing >>>"
  SHOWALL_STRING = "<<< Show All >>>"
  MAX_REPORT_COLUMNS = 100      # Default maximum number of columns in a report
  GRAPH_MAX_COUNT = 10

  TREND_MODEL = "VimPerformanceTrend"   # Performance trend model name requiring special processing

  # Source pulldown in VM Options
  PLANNING_VM_MODES = {
    :allocated => N_("Allocation"),
    :reserved  => N_("Reservation"),
    :used      => N_("Usage"),
    :manual    => N_("Manual Input")
  }
  VALID_PLANNING_VM_MODES = PLANNING_VM_MODES.keys.index_by(&:to_s)

  TASK_TIME_PERIODS = {
    0 => N_("Today"),
    1 => N_("1 Day Ago"),
    2 => N_("2 Days Ago"),
    3 => N_("3 Days Ago"),
    4 => N_("4 Days Ago"),
    5 => N_("5 Days Ago"),
    6 => N_("6 Days Ago")
  }
  TASK_STATES = [[N_("Initializing"), "initializing"], [N_("Waiting to Start"), "Waiting_to_start"],
                 [N_("Cancelling"), "Cancelling"], [N_("Aborting"), "Aborting"], [N_("Finished"), "Finished"],
                 [N_("Snapshot Create"), "Snapshot_create"], [N_("Scanning"), "Scanning"],
                 [N_("Snapshot Delete"), "Snapshot_delete"], [N_("Synchronizing"), "Synchronizing"],
                 [N_("Deploy Smartproxy"), "Deploy_smartproxy"],
                 [N_("Initialized"), "Initialized"], [N_("Queued"), "Queued"], [N_("Active"), "Active"]].freeze

  PROV_STATES = {
    "pending_approval" => N_("Pending Approval"),
    "approved"         => N_("Approved"),
    "denied"           => N_("Denied")
  }
  PROV_TIME_PERIODS = {
    1  => N_("Last 24 Hours"),
    7  => N_("Last 7 Days"),
    30 => N_("Last 30 Days")
  }

  ALL_TIMEZONES = ActiveSupport::TimeZone.all.collect { |tz| ["(GMT#{tz.formatted_offset}) #{tz.name}", tz.name] }
  # Following line does not include timezones with partial hour offsets
  # ALL_TIMEZONES = ActiveSupport::TimeZone.all.collect{|tz| tz.utc_offset % 3600 == 0 ? ["(GMT#{tz.formatted_offset}) #{tz.name}",tz.name] : nil}.compact

  CATEGORY_CHOICES = {}
  CATEGORY_CHOICES["services"] = N_("Services")
  CATEGORY_CHOICES["software"] = N_("Software")
  CATEGORY_CHOICES["system"] = N_("System")
  CATEGORY_CHOICES["accounts"] = N_("User Accounts")
  CATEGORY_CHOICES["vmconfig"] = N_("VM Configuration")
  # CATEGORY_CHOICES["vmevents"] = "VM Events"

  # Assignment choices
  ASSIGN_TOS = {}

  # This set of assignments was created for miq_alerts
  ASSIGN_TOS["ExtManagementSystem"] = {
    "enterprise"                 => N_("The Enterprise"),
    "ext_management_system"      => N_("Selected Providers"),
    "ext_management_system-tags" => N_("Tagged Providers")
  }
  ASSIGN_TOS["EmsCluster"] = {
    "ems_cluster"      => N_("Selected Cluster / Deployment Roles"),
    "ems_cluster-tags" => N_("Tagged Cluster / Deployment Roles"),
  }.merge(ASSIGN_TOS["ExtManagementSystem"])
  ASSIGN_TOS["Host"] = {
    "host"      => N_("Selected Host / Nodes"),
    "host-tags" => N_("Tagged Host / Nodes")
  }.merge(ASSIGN_TOS["EmsCluster"])
  ASSIGN_TOS["Vm"] = {
    "ems_folder"         => N_("Selected Folders"),
    "resource_pool"      => N_("Selected Resource Pools"),
    "resource_pool-tags" => N_("Tagged Resource Pools"),
    "vm-tags"            => N_("Tagged VMs and Instances")
  }.merge(ASSIGN_TOS["Host"])
  ASSIGN_TOS["Storage"] = {
    "enterprise"   => N_("The Enterprise"),
    "storage"      => N_("Selected Datastores"),
    "storage-tags" => N_("Tagged Datastores"),
    "tenant"       => N_("Tenants")
  }
  ASSIGN_TOS["MiqServer"] = {
    "miq_server" => N_("Selected Servers"),
  }
  ASSIGN_TOS["MiddlewareServer"] = {
    "enterprise"        => N_("The Enterprise"),
    "middleware_server" => N_("Selected Middleware Servers")
  }
  ASSIGN_TOS["ContainerNode"] = {
    "enterprise" => N_("The Enterprise"),
  }


  # This set of assignments was created for chargeback_rates
  ASSIGN_TOS[:chargeback_storage] = ASSIGN_TOS["Storage"]
  ASSIGN_TOS[:chargeback_compute] = {
    "enterprise"             => N_("The Enterprise"),
    "ext_management_system"  => N_("Selected Providers"),
    "ems_cluster"            => N_("Selected Cluster / Deployment Roles"),
    "ems_container"          => N_("Selected Containers Providers"),
    "vm-tags"                => N_("Tagged VMs and Instances"),
    "container_image-tags"   => N_("Tagged Container Images"),
    "container_image-labels" => N_("Labeled Container Images"),
    "tenant"                 => N_("Tenants")
  }

  EXP_COUNT_TYPE = [N_("Count of"), "count"].freeze  # Selection for count based filters
  EXP_FIND_TYPE = [N_("Find"), "find"].freeze        # Selection for find/check filters
  EXP_TYPES = [                           # All normal filters
    [N_("Field"), "field"],
    EXP_COUNT_TYPE,
    [N_("Tag"), "tag"],
    EXP_FIND_TYPE
  ]
  VM_EXP_TYPES = [                        # Special VM registry filter
    [N_("Registry"), "regkey"]
  ]

  # Snapshot ages for delete_snapshots_by_age action type
  SNAPSHOT_AGES = {}
  (1..23).each { |a| SNAPSHOT_AGES[a.hours.to_i] = (a.to_s + (a < 2 ? _(" Hour") : _(" Hours"))) }
  (1..6).each { |a| SNAPSHOT_AGES[a.days.to_i] = (a.to_s + (a < 2 ? _(" Day") : _(" Days"))) }
  (1..4).each { |a| SNAPSHOT_AGES[a.weeks.to_i] = (a.to_s + (a < 2 ? _(" Week") : _(" Weeks"))) }

  # Expression constants
  EXP_TODAY = "Today"
  EXP_FROM = "FROM"
  EXP_IS = "IS"

  # FROM Date/Time expression atom selectors
  FROM_HOURS = [
    N_('This Hour'),
    N_('Last Hour'),
    N_('2 Hours Ago'),
    N_('3 Hours Ago'),
    N_('4 Hours Ago'),
    N_('5 Hours Ago'),
    N_('6 Hours Ago'),
    N_('7 Hours Ago'),
    N_('8 Hours Ago'),
    N_('9 Hours Ago'),
    N_('10 Hours Ago'),
    N_('11 Hours Ago'),
    N_('12 Hours Ago'),
    N_('13 Hours Ago'),
    N_('14 Hours Ago'),
    N_('15 Hours Ago'),
    N_('16 Hours Ago'),
    N_('17 Hours Ago'),
    N_('18 Hours Ago'),
    N_('19 Hours Ago'),
    N_('20 Hours Ago'),
    N_('21 Hours Ago'),
    N_('22 Hours Ago'),
    N_('23 Hours Ago')
  ]
  FROM_DAYS = [
    N_('Today'),
    N_('Yesterday'),
    N_('2 Days Ago'),
    N_('3 Days Ago'),
    N_('4 Days Ago'),
    N_('5 Days Ago'),
    N_('6 Days Ago'),
    N_('7 Days Ago'),
    N_('14 Days Ago')
  ]
  FROM_WEEKS = [
    N_('This Week'),
    N_('Last Week'),
    N_('2 Weeks Ago'),
    N_('3 Weeks Ago'),
    N_('4 Weeks Ago')
  ]
  FROM_MONTHS = [
    N_('This Month'),
    N_('Last Month'),
    N_('2 Months Ago'),
    N_('3 Months Ago'),
    N_('4 Months Ago'),
    N_('6 Months Ago')
  ]
  FROM_QUARTERS = [
    N_('This Quarter'),
    N_('Last Quarter'),
    N_('2 Quarters Ago'),
    N_('3 Quarters Ago'),
    N_('4 Quarters Ago')
  ]
  FROM_YEARS = [
    N_('This Year'),
    N_('Last Year'),
    N_('2 Years Ago'),
    N_('3 Years Ago'),
    N_('4 Years Ago')
  ]

  # Need this for display purpose to map with id
  WIDGET_TYPES = {
    "r"  => N_('Reports'),
    "c"  => N_('Charts'),
    "rf" => N_('RSS Feeds'),
    "m"  => N_('Menus')
  }

  SINGULAR_WIDGET_TYPES = {
    "r"  => N_('Report'),
    "c"  => N_('Chart'),
    "rf" => N_('RSS Feed'),
    "m"  => N_('Menu')
  }
  # Need this for mapping with MiqWidget record content_type field
  WIDGET_CONTENT_TYPE = {
    "r"  => "report",
    "c"  => "chart",
    "rf" => "rss",
    "m"  => "menu"
  }

  VALID_PERF_PARENTS = {
    "EmsCluster" => :ems_cluster,
    "Host"       => :host
  }

  MIQ_AE_COPY_ACTIONS = %w(miq_ae_class_copy miq_ae_instance_copy miq_ae_method_copy)

  UTF_16BE_BOM = [254, 255].freeze
  UTF_16LE_BOM = [255, 254].freeze
end

# Make these constants globally available
include UiConstants
