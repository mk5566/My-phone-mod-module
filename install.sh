# Magisk mount
SKIPMOUNT=false

# load system.prop
PROPFILE=true

  ui_print "✦ Deleting WLAN Logs"
  rm -rf /data/vendor/wlan_logs 
  ui_print "✦ Deleting System Logs"
  rm -rf /dev/log/*
  ui_print "✦ Deleting Kernel Logs"
  rm -rf /sys/kernel/debug/*
  ui_print "✦ Deleting Thermal Logs"
  rm -rf /data/vendor/thermal/thermal.dump
  rm -rf /data/vendor/thermal/last_thermal.dump
  rm -rf /data/vendor/thermal/thermal_history.dump
  rm -rf /data/vendor/thermal/thermal_history_last.dump
  ui_print "✦ Deleting ANR Logs"
  rm -rf /data/anr/*
  ui_print "✦ Deleting Dev Logs"
  rm -rf /dev/log/*
  ui_print "✦ Disabling Timer Migration"
  echo "0" > /proc/sys/kernel/timer_migration
  ui_print "✦ Disabling SeLinux Logs"
  echo 0 >/sys/fs/selinux/log/deny_unknown  
  ui_print "✦ Disabling logs in init.rc..."
  sed -i 's/service logd/service logd disabled/g' /system/etc/init/rc
  sed -i 's/on property:sys.log.redirect-stdio=1/on property:sys.log.redirect-stdio=0/g' /system/etc/init/rc
  sed -i 's/setprop persist.service.logging.enable 1/# setprop persist.service.logging.enable 1/g' /system/etc/init/rc
  ui_print "-------------------------------------"
  ui_print "✦ Disabling Kernel Logs" 
  sysctl -w kernel.panic=0
  sysctl -w vm.panic_on_oom=0
  sysctl -w kernel.panic_on_oops=0
  sysctl -w kernel.softlockup_panic=0
  sysctl -w vm.oom_dump_tasks=0
  sysctl -w vm.oom_kill_allocating_task=0
  echo "0 0 0 0" > /proc/sys/kernel/printk
  echo "off" > /proc/sys/kernel/printk_devkmsg
  echo "0" > /proc/sys/debug/exception-trace
  echo "0" > /proc/sys/kernel/compat-log
  ui_print "-------------------------------------"
  ui_print "✦ Trim storage"
  fstrim -v /cache
  fstrim -v /system
  fstrim -v /vendor
  fstrim -v /data
  fstrim -v /preload
su -c "pm disable com.google.android.gms/com.google.android.gms.ads.identifier.service.AdvertisingIdNotificationService"
su -c "pm disable com.google.android.gms/com.google.android.gms.ads.identifier.service.AdvertisingIdService"
ui_print "✦ Disabling advertising and tracking in Google Play services."
su -c "pm disable com.google.android.gms/com.google.android.gms.analytics.AnalyticsService"
su -c "pm disable com.google.android.gms/com.google.android.gms.analytics.AnalyticsTaskService"
su -c "pm disable com.google.android.gms/com.google.android.gms.analytics.internal.PlayLogReportingService"
su -c "pm disable com.google.android.gms/com.google.android.gms.stats.eastworld.EastworldService"
su -c "pm disable com.google.android.gms/com.google.android.gms.stats.service.DropBoxEntryAddedService"
su -c "pm disable com.google.android.gms/com.google.android.gms.stats.PlatformStatsCollectorService"
su -c "pm disable com.google.android.gms/com.google.android.gms.common.stats.GmsCoreStatsService"
su -c "pm disable com.google.android.gms/com.google.android.gms.common.stats.StatsUploadService"
su -c "pm disable com.google.android.gms/com.google.android.gms.backup.stats.BackupStatsService"
su -c "pm disable com.google.android.gms/com.google.android.gms.checkin.CheckinApiService"
su -c "pm disable com.google.android.gms/com.google.android.gms.checkin.CheckinService"
su -c "pm disable com.google.android.gms/com.google.android.gms.tron.CollectionService"
su -c "pm disable com.google.android.gms/com.google.android.gms.common.config.PhenotypeCheckinService"
ui_print "Restricting Google’s data collection on your device."
su -c "pm disable com.google.android.gms/com.google.android.location.internal.server.HardwareArProviderService"
ui_print "✦ Disabling the battery-draining HardwareArProviderService."
su -c "pm disable com.google.android.gms/com.google.android.gms.feedback.FeedbackAsyncService"
su -c "pm disable com.google.android.gms/com.google.android.gms.feedback.LegacyBugReportService"
su -c "pm disable com.google.android.gms/com.google.android.gms.feedback.OfflineReportSendTaskService"
su -c "pm disable com.google.android.gms/com.google.android.gms.googlehelp.metrics.ReportBatchedMetricsGcmTaskService"
su -c "pm disable com.google.android.gms/com.google.android.gms.analytics.internal.PlayLogReportingService"
su -c "pm disable com.google.android.gms/com.google.android.gms.locationsharingreporter.service.reporting.periodic.PeriodicReporterMonitoringService"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.ReportingAndroidService"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.ReportingSyncService"
su -c "pm disable com.google.android.gms/com.google.android.gms.common.stats.net.NetworkReportService"
su -c "pm disable com.google.android.gms/com.google.android.gms.presencemanager.service.PresenceManagerPresenceReportService"
su -c "pm disable com.google.android.gms/com.google.android.gms.usagereporting.service.UsageReportingIntentService"
ui_print "✦ Disabling bug reporting in Google Play services."
su -c "pm disable com.google.android.gms/com.google.android.gms.clearcut.debug.ClearcutDebugDumpService"
ui_print "✦ Disabling debugging services in Google Play Services."
su -c "pm disable com.google.firebase.components.ComponentDiscoveryService"
su -c "pm disable com.google.android.gms/com.google.mlkit.common.internal.MlKitComponentDiscoveryService"
ui_print "✦ Disabling component discovery services in Google Play and Firebase."
su -c "pm disable com.google.android.gms/com.google.android.gms.enpromo.PromoInternalPersistentService"
su -c "pm disable com.google.android.gms/com.google.android.gms.enpromo.PromoInternalService"
ui_print "✦ Disabling enpromo-related services."
su -c "pm disable com.google.android.gms/com.google.android.gms.analytics.internal.PlayLogReportingService"
su -c "pm disable com.google.android.gms/com.google.android.gms.romanesco.ContactsLoggerUploadService"
su -c "pm disable com.google.android.gms/com.google.android.gms.magictether.logging.DailyMetricsLoggerService"
su -c "pm disable com.google.android.gms/com.google.android.gms.checkin.EventLogService"
su -c "pm disable com.google.android.gms/com.google.android.gms.backup.component.FullBackupJobLoggerService"
ui_print "✦ Disabling logging and data collection services."
su -c "pm disable com.google.android.gms/com.google.android.gms.security.safebrowsing.SafeBrowsingUpdateTaskService"
su -c "pm disable com.google.android.gms/com.google.android.gms.security.verifier.ApkUploadService"
su -c "pm disable com.google.android.gms/com.google.android.gms.security.verifier.InternalApkUploadService"
su -c "pm disable com.google.android.gms/com.google.android.gms.security.snet.SnetIdleTaskService"
su -c "pm disable com.google.android.gms/com.google.android.gms.security.snet.SnetNormalTaskService"
su -c "pm disable com.google.android.gms/com.google.android.gms.security.snet.SnetService"
su -c "pm disable com.google.android.gms/com.google.android.gms.droidguard.DroidGuardGcmTaskService"
ui_print "✦ Disabling security and app verification services."
su -c "pm disable com.google.android.gms/com.google.android.gms.chimera.GmsApiServiceNoInstantApps"
su -c "pm disable com.google.android.gms/com.google.android.gms.chimera.PersistentApiServiceNoInstantApps"
su -c "pm disable com.google.android.gms/com.google.android.gms.instantapps.service.InstantAppsService"
su -c "pm disable com.google.android.gms/com.google.android.gms.chimera.UiApiServiceNoInstantApps"
ui_print "✦ Disabling Google Instant Apps services."
pm enable com.google.android.gms/com.google.android.gms.droidguard.DroidGuardService
ui_print "✦ Fixing CTS"
rm -rf /data/adb/modules/AdvanceCleaner