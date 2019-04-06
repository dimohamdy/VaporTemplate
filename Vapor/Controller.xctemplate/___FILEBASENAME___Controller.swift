//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Vapor

final class ___VARIABLE_modelName___Controller: RouteCollection {
    func boot(router: Router) throws {
        let routes = router.grouped("api", "___VARIABLE_modelName___")
        routes.get(use: index)
        routes.patch(use: update)
        routes.delete(Int.parameter, use: delete)
        routes.post(use: create)
        routes.put(use: update)

    }

    func index(_ req: Request) throws -> Future<[___VARIABLE_modelName___]> {
        return ___VARIABLE_modelName___
            .query(on: req)
            .all()
    }

    func create(_ req: Request) throws -> Future<___VARIABLE_modelName___> {
        return try req
            .content
            .decode(___VARIABLE_modelName___.self)
            .flatMap(to: ___VARIABLE_modelName___.self) { obj___VARIABLE_modelName___ in
                return obj___VARIABLE_modelName___.save(on: req)
        }
    }

    func update(_ req: Request) throws -> Future<___VARIABLE_modelName___> {
        return try req
            .content
            .decode(___VARIABLE_modelName___.self)
            .flatMap(to: ___VARIABLE_modelName___.self) { obj___VARIABLE_modelName___ in
                return obj___VARIABLE_modelName___.update(on: req)
        }
    }

    func delete(_ req: Request) throws -> Future<___VARIABLE_modelName___> {
        let id = try req.parameters.next(Int.self)
        return ___VARIABLE_modelName___
            .find(id, on: req)
            .unwrap(or: Abort(.notFound))
            .delete(on: req)
    }
}
