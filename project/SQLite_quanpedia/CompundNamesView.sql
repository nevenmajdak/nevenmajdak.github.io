/* View created for customers report*/

CREATE VIEW CmpNameParProd AS
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
           CmpndAnalisys
     WHERE MRMIonDetailsView.CompoundID = CmpndAnalisys.CompoundID AND 
           IonMode.IonModeID = MRMIonDetailsView.IonModeID;
