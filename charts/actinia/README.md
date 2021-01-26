## actinia considerations on storage

* __grassdb__
  * usually mounted at `/actinia_core/grassdb/`
  * contains read-only geodata in GRASS GIS format, shared between all Pods. No data is written during runtime of actinia but all data can be used for processing.
* __userdata__
  * usually mounted at `/actinia_core/userdata/`
  * contains writable geodata in GRASS GIS format, shared between all Pods. Access is group-based and results for persistent processing are stored here.
* __resources__
  * usually mounted at `/actinia_core/resources/`
  * contains results for ephemeral processing ready for download as well as temporary results, shared between all Pods (read + write).
* __workspace__ (actinia-worker-workspace)
  * usually located at `/actinia_core/workspace/temp_db`
  * During calculation, all needed data from grassdb + userdata is stored here. All processes run here. This should be the fastest storage available. Results are either saved to userdata or resources, so this storage does not need to be persistent or shared with other Pods.
* __temporary data__
  * usually located at `/actinia_core/workspace/tmp`
  * contains temporary data, does not need to be persistent or shared with other Pods.
* __geodata__
  * usually mounted at `/mnt/geodata/`
  * contains geodata of all kinds, usually not only maintained by actinia but shared with other components of the cluster. If applicable, processing results are written to this storage for other components to use.
