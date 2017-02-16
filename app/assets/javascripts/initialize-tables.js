Echo.initializeTables = function(){
  $("#lockouts-table").dynatable({
    inputs: {
      searchText: "Filter: "
    }
  });
  
  $("#lockouts-results-table").dynatable({
    features: {
    },
    params: {
      dynatable: 'dynatable2',
      queries: 'queries2',
      sorts: 'sorts2',
      page: 'page2',
      perPage: 'perPage2',
      offset: 'offset2',
      records: 'records',
      record: null,
      queryRecordCount: 'queryRecordCount2',
      totalRecordCount: 'totalRecordCount2'
    },
    inputs: {
      searchText: "Filter: "
    }
  });
};