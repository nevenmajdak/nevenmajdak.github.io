CREATE VIEW CmpndAnalisys AS
    SELECT CmpndAnalisys.Analysis AS Analysis,
           CmpndAnalisys.Compound AS Name,
           CmpndAnalisys.Formula AS Formula,
           IonMode.Name AS IonMode,
           ParentMass,
           ProductMass,
           CV,
           CE
      FROM MRMIonDetailsView,
           IonMode,
           (
               SELECT Analysis.Name AS Analysis,
                      Compound.Name AS Compound,
                      Compound.Formula AS Formula,
                      Compound.CompoundID
                 FROM (
                          Compound
                          INNER JOIN
                          IonDetails ON Compound.CompoundID = IonDetails.CompoundID
                      )
                      INNER JOIN
                      (
                          Analysis
                          INNER JOIN
                          CompoundsInAnalysis ON Analysis.AnalysisID = CompoundsInAnalysis.AnalysisID
                      )
                      ON IonDetails.IonDetailsID = CompoundsInAnalysis.IonDetailsID
           )
           AS CmpndAnalisys
     WHERE MRMIonDetailsView.CompoundID = CmpndAnalisys.CompoundID AND 
           IonMode.IonModeID = MRMIonDetailsView.IonModeID;
