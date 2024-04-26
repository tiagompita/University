package aula09.Ex3;


import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;

public class PlaneManager {

    private Collection<Plane> PlaneManager;

    public PlaneManager() {
        PlaneManager = new HashSet<>();
    }

    public void addPlane(Plane plane) {
        PlaneManager.add(plane);
    }

    public void removePlane(String id) {
        Plane planeToRemove = null;
        for (Plane plane : PlaneManager) {
            if (plane.getID().equals(id)) {
                planeToRemove = plane;
                break;
            }
        }
        if (planeToRemove != null) {
            PlaneManager.remove(planeToRemove);
            System.out.println("Avião removido!");
            System.out.println();
        } else {
            System.out.println("O ID não existe na frota, nenhum avião removido!");
            System.out.println();
        }
    }

    public Plane searchPlane(String id) {
        Plane planeToSearch = null;
        for (Plane plane : PlaneManager) {
            if (plane.getID().equals(id)) {
                planeToSearch = plane;
                break;
            }
        }
        if (planeToSearch != null) {
            return planeToSearch;
        } else {
            return null;
        }
    }

    public ArrayList<Plane> getCommercialPlanes() {
        ArrayList<Plane> Comercial = new ArrayList<>();
        for (Plane plane : PlaneManager) {
            if (plane.getPlaneType() == "Comercial") {
                Comercial.add(plane);
            }
        }

        return Comercial;
    }

    public ArrayList<Plane> getMilitaryPlanes() {
        ArrayList<Plane> Militar = new ArrayList<>();
        for (Plane plane : PlaneManager) {
            if (plane.getPlaneType() == "Militar") {
                Militar.add(plane);
            }
        }

        return Militar;
    }

    public void printAllPlanes() {
        System.out.println("Aviões na Frota");
        System.out.println();
        for (Plane plane : PlaneManager) {
            System.out.println(plane);
        }
    }

    public Plane getFastestPlane() {
        int fastest = 0;
        Plane MaisRapido = null;

        for (Plane plane : PlaneManager) {
            if (plane.getMaxVel() > fastest) {
                fastest = plane.getMaxVel();
                MaisRapido = plane;
            }
        }

        return MaisRapido;
    }

}
